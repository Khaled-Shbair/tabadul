import '/config/all_imports.dart';

class RegisterAsServiceProvideScreen extends StatelessWidget with CustomToast {
  const RegisterAsServiceProvideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = instance<RegisterAsServiceProvideBloc>();
    return BlocProvider<RegisterAsServiceProvideBloc>.value(
      value: controller,
      child: BlocListener<RegisterAsServiceProvideBloc,
          RegisterAsServiceProvideState>(
        listener: (context, state) {
          if (state is RegisterAsServiceProvideFailure) {
            Navigator.of(context, rootNavigator: true).pop();
            showToast(message: state.message, context: context);
          }
          if (state is RegisterAsServiceProvideLoading) {
            customLoading(context);
          }
          if (state is RegisterAsServiceProvideSuccessfully) {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.pushReplacementNamed(
                context, Routes.registerAsServiceProvideSuccessfullyScreen);
            disposeRegisterAsServiceProvide();
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: ManagerStrings.registerAsServiceProvide,
            functionLeadingButton: () {
              Navigator.pop(context);
            },
          ),
          body: Form(
            key: controller.formKey,
            child: ListView(
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeight.h10,
                bottom: ManagerHeight.h10,
                start: ManagerWidth.w38,
                end: ManagerWidth.w36,
              ),
              primary: false,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w82,
                    end: ManagerWidth.w81,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BlocBuilder<RegisterAsServiceProvideBloc,
                          RegisterAsServiceProvideState>(
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
                                      PickProfileImageFromCamera(image.path));
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
                                      PickProfileImageFromGallery(image.path));
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
                  initialValue:
                      '${controller.sharedPref.getString(SharedPreferenceKeys.firstName)} ${controller.sharedPref.getString(SharedPreferenceKeys.lastName)}',
                  readOnly: true,
                ),
                verticalSpace(ManagerHeight.h10),
                CustomTextField(
                  initialValue: controller.sharedPref
                      .getString(SharedPreferenceKeys.phoneNumber),
                  readOnly: true,
                ),
                verticalSpace(ManagerHeight.h10),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  textEditingController: controller.job,
                  hintText: ManagerStrings.job,
                  maxLength: 20,
                  validator: (v) => Validator.jobValidator(v),
                ),
                verticalSpace(ManagerHeight.h10),
                CustomTextField(
                  initialValue: controller.sharedPref
                      .getString(SharedPreferenceKeys.regionAndStreet),
                  readOnly: true,
                ),
                verticalSpace(ManagerHeight.h10),
                CustomTextField(
                  initialValue: controller.sharedPref
                      .getString(SharedPreferenceKeys.city),
                  readOnly: true,
                ),
                verticalSpace(ManagerHeight.h10),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  textEditingController: controller.descriptionOfJob,
                  validator: (v) => Validator.descriptionOfJobValidator(v),
                  maxLines: 3,
                  hintMaxLines: 4,
                  maxLength: 120,
                  hintText: ManagerStrings.descriptionOfJob,
                ),
                verticalSpace(ManagerHeight.h15),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w20,
                    end: ManagerWidth.w20,
                  ),
                  child: CustomButton(
                    child: Text(
                      ManagerStrings.register,
                      style: context.textTheme.titleSmall,
                    ),
                    onPressed: () {
                      controller.add(RegisterProcess());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
