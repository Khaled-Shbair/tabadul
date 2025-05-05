import '/config/all_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<LoginBloc>();
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        if (state is LoginSuccessfully) {
          context.pop();
          context.pushNamed(
            Routes.securityCodeScreen,
            arguments: [Routes.homeScreen, state.phoneNumber],
          );
        }
        if (state is LoginLoading) {
          customLoading(context);
        }
        if (state is LoginFailure) {
          context.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: ManagerStrings.login),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ListView(
            padding: EdgeInsetsDirectional.only(
              top: ManagerHeight.h52,
              start: ManagerWidth.w38,
              end: ManagerWidth.w36,
              bottom: ManagerHeight.h20,
            ),
            primary: false,
            children: [
              SvgPicture.asset(
                ManagerAssets.login,
                height: ManagerHeight.h185,
                width: ManagerWidth.w177,
              ),
              verticalSpace(ManagerHeight.h67),
              Form(
                key: controller.formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocSelector<LoginBloc, LoginState, String?>(
                      selector: (state) =>
                          (state is LoginFailure) ? state.message : null,
                      builder: (context, errorMessage) {
                        return CustomEnterPhoneNumberFiled(
                          errorMessage: errorMessage,
                          controller: controller.phoneController,
                          onFieldSubmitted: (v) =>
                              controller.add(LoginProcess()),
                        );
                      },
                    ),
                    horizontalSpace(ManagerWidth.w8),
                    BlocSelector<LoginBloc, LoginState, String>(
                      selector: (state) => (state is SelectedCodeCountry)
                          ? state.selectedValue
                          : AppConstants.countriesCodes[0].id.toString(),
                      builder: (context, selectedCodeCountry) {
                        return CustomMenuChooseCodeCountry(
                          function: (value) =>
                              controller.add(SelectCodeCountry(value)),
                          selectedId: selectedCodeCountry,
                          list: AppConstants.countriesCodes,
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w20,
                  end: ManagerWidth.w20,
                  top: ManagerHeight.h12,
                  bottom: ManagerHeight.h55,
                ),
                child: CustomButton(
                  onPressed: () => controller.add(LoginProcess()),
                  textButton: ManagerStrings.login,
                ),
              ),
              CustomRichText(
                recognizer: controller.tapGestureRecognizer
                  ..onTap = () => context.pushNamed(Routes.createAccountScreen),
                title: ManagerStrings.doNotHaveAnAccount,
                subTitle: ManagerStrings.createAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
