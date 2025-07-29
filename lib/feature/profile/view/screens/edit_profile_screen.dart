import '/feature/profile/controller/edit_profile_bloc.dart' as edit;

import '/config/all_imports.dart';

class EditProfileScreen extends StatelessWidget with CustomToast {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<EditProfileBloc>();
    return BlocListener<EditProfileBloc, edit.EditProfileState>(
      listener: (context, state) {
        if (state is edit.EditProfileSuccessfully) {
          final navigator = Navigator.of(context, rootNavigator: true);
          if (navigator.canPop()) navigator.pop();
          if (Navigator.of(context).canPop()) Navigator.of(context).pop(true);
          disposeEditProfile();
        }

        if (state is edit.EditProfileFailure) {
          if (context.mounted) {
            final navigator = Navigator.of(context, rootNavigator: true);
            if (navigator.canPop()) {
              navigator.pop();
            }
          }
          showToast(context: context, message: state.messageError, error: true);
        }
        if (state is edit.EditProfileLoading) {
          customLoading(context);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: ManagerStrings.editProfile,
          functionLeadingButton: () {
            Navigator.of(context).pop();
            disposeEditProfile();
          },
        ),
        body: Form(
          key: controller.formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(
              primary: false,
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w38,
                end: ManagerWidth.w38,
                bottom: ManagerHeight.h15,
                top: ManagerHeight.h30,
              ),
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w82,
                    end: ManagerWidth.w81,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BlocBuilder<EditProfileBloc, edit.EditProfileState>(
                        builder: (context, state) {
                          String image = state.image;
                          return CircleAvatar(
                            backgroundImage: image.startsWith('http')
                                ? CachedNetworkImageProvider(image)
                                : FileImage(File(image)),
                            radius: ManagerRadius.r60,
                          );
                        },
                      ),
                      SizedBox(
                        width: ManagerWidth.w26,
                        height: ManagerHeight.h26,
                        child: CustomButton(
                          onPressed: () {
                            customImageSelectionBox(
                              context,
                              onTapCamera: () async {
                                final XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (image != null) {
                                  controller.add(
                                      edit.PickProfileImageFromCamera(
                                          image.path));
                                  if (context.mounted) {
                                    final navigator = Navigator.of(context,
                                        rootNavigator: true);
                                    if (navigator.canPop()) {
                                      navigator.pop();
                                    }
                                  }
                                }
                              },
                              onTapGallery: () async {
                                final XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (image != null) {
                                  controller.add(
                                      edit.PickProfileImageFromGallery(
                                          image.path));
                                  if (context.mounted) {
                                    final navigator = Navigator.of(context,
                                        rootNavigator: true);
                                    if (navigator.canPop()) {
                                      navigator.pop();
                                    }
                                  }
                                }
                              },
                            );
                          },
                          color: context.theme.colorScheme.surface,
                          padding: EdgeInsetsDirectional.zero,
                          shape: CircleBorder(),
                          elevation: 3,
                          child: Icon(
                            Icons.camera_alt,
                            color: context.theme.primaryColor,
                            size: ManagerIconsSizes.i16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(ManagerHeight.h30),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  textEditingController: controller.firstName,
                  hintText: ManagerStrings.firstName,
                  textInputAction: TextInputAction.next,
                  helperText: ' ',
                  validator: (v) => Validator.firstNameValidator(v),
                ),
                CustomTextField(
                  helperText: ' ',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textEditingController: controller.lastName,
                  hintText: ManagerStrings.lastName,
                  validator: (v) => Validator.lastNameValidator(v),
                ),
                BlocSelector<edit.EditProfileBloc, edit.EditProfileState,
                    List<String>>(
                  selector: (state) => state is edit.EditProfileInitial &&
                          state.cities.isNotEmpty
                      ? state.cities
                      : [],
                  builder: (context, cities) {
                    return CustomDropdownSearch(
                      items: cities,
                      onChangedFunction: (v) {
                        if (v != null) {
                          controller.add(edit.SelectCity(v));
                        }
                      },
                      selectedItem: controller.selectedCity,
                      hintText: ManagerStrings.city,
                      validator: (v) => Validator.dropdownSearchCity(v),
                      textInputAction: TextInputAction.next,
                    );
                  },
                ),
                BlocSelector<edit.EditProfileBloc, edit.EditProfileState,
                    List<String>>(
                  selector: (state) => state is edit.EditProfileInitial &&
                          state.regions.isNotEmpty
                      ? state.regions
                      : [],
                  builder: (context, regions) {
                    return CustomDropdownSearch(
                      items: regions,
                      validator: (v) => Validator.dropdownSearchRegionStreet(v),
                      hintText: ManagerStrings.regionAndStreet,
                      textInputAction: TextInputAction.done,
                      selectedItem: controller.selectedRegion,
                      onChangedFunction: (v) {
                        if (v != null) {
                          controller.add(edit.SelectRegion(v));
                        }
                      },
                    );
                  },
                ),
                verticalSpace(ManagerHeight.h10),
                CustomButton(
                  textButton: ManagerStrings.save,
                  onPressed: () => controller.add(edit.EditButton()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
