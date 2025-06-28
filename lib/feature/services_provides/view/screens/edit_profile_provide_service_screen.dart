import '/config/all_imports.dart';

class EditProfileProvideServiceScreen extends StatelessWidget with CustomToast {
  const EditProfileProvideServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<EditProfileProvideServiceBloc>();
    return BlocListener<EditProfileProvideServiceBloc,
        EditProfileProvideServiceState>(
      listener: (context, state) {
        if (state is EditProfileProvideServiceLoading) {
          customLoading(context);
        } else if (state is EditProfileProvideServiceSuccessfully) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pop(context, true);
          disposeEditProfileProvideService();
        } else if (state is EditProfileProvideServiceFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showToast(message: state.messageError, context: context);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: ManagerStrings.editProfileServiceProvide,
          titleStyle: context.textTheme.titleSmall?.copyWith(
            color: context.theme.primaryColor,
          ),
          functionLeadingButton: () {
            Navigator.pop(context);
            disposeEditProfileProvideService();
          },
        ),
        body: ListView(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w38,
            top: ManagerHeight.h10,
            end: ManagerWidth.w36,
          ),
          primary: false,
          children: [
            SizedBox(
              height: ManagerHeight.h180,
              width: ManagerWidth.infinity,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  BlocBuilder<EditProfileProvideServiceBloc,
                      EditProfileProvideServiceState>(
                    builder: (context, state) {
                      return Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: ManagerHeight.h163,
                          width: ManagerWidth.infinity,
                          margin: EdgeInsetsDirectional.only(
                            start: ManagerWidth.w20,
                            end: ManagerWidth.w20,
                            bottom: ManagerHeight.h10,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: state.image.contains('http')
                                  ? CachedNetworkImageProvider(state.image)
                                  : FileImage(File(state.image)),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w25,
                    ),
                    child: CustomButton(
                      height: ManagerHeight.h32,
                      minWidth: ManagerWidth.w32,
                      onPressed: () {
                        customImageSelectionBox(
                          context,
                          onTapCamera: () async {
                            final XFile? image = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (image != null) {
                              controller.add(PickImageFromCamera(image.path));
                              if (context.mounted) {
                                final navigator =
                                    Navigator.of(context, rootNavigator: true);
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
                              controller.add(PickImageFromGallery(image.path));
                              if (context.mounted) {
                                final navigator =
                                    Navigator.of(context, rootNavigator: true);
                                if (navigator.canPop()) {
                                  navigator.pop();
                                }
                              }
                            }
                          },
                        );
                      },
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.camera_alt,
                        size: ManagerIconsSizes.i18,
                        color: context.theme.colorScheme.surface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(ManagerHeight.h4),
            CustomTextField(
              readOnly: true,
              initialValue:
                  '${controller.sharedPref.getString(SharedPreferenceKeys.firstName)} ${controller.sharedPref.getString(SharedPreferenceKeys.lastName)}',
            ),
            verticalSpace(ManagerHeight.h10),
            CustomTextField(
              readOnly: true,
              initialValue: controller.sharedPref
                  .getString(SharedPreferenceKeys.phoneNumber),
            ),
            verticalSpace(ManagerHeight.h10),
            CustomTextField(
              keyboardType: TextInputType.text,
              textEditingController: controller.job,
              maxLength: 20,
              suffixIcon: Icon(
                Icons.edit,
                size: ManagerIconsSizes.i20,
              ),
            ),
            verticalSpace(ManagerHeight.h10),
            CustomTextField(
              readOnly: true,
              initialValue:
                  controller.sharedPref.getString(SharedPreferenceKeys.city),
            ),
            verticalSpace(ManagerHeight.h8),
            CustomTextField(
              readOnly: true,
              initialValue: controller.sharedPref
                  .getString(SharedPreferenceKeys.regionAndStreet),
            ),
            verticalSpace(ManagerHeight.h10),
            CustomTextField(
              keyboardType: TextInputType.text,
              textEditingController: controller.description,
              maxLines: 3,
              hintMaxLines: 4,
              maxLength: 120,
              suffixIcon: Icon(
                Icons.edit,
                size: ManagerIconsSizes.i20,
              ),
            ),
            verticalSpace(ManagerHeight.h18),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeight.h18,
                start: ManagerWidth.w20,
                end: ManagerWidth.w20,
              ),
              child: CustomButton(
                child: Text(
                  ManagerStrings.save,
                  style: context.textTheme.titleSmall,
                ),
                onPressed: () {
                  controller.add(SaveEditedData());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
