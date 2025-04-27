import '/config/all_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        if (state is LoginSuccessfully) {
          context.pop();
          context.pushNamed(
            Routes.securityCodeScreen,
            arguments: [Routes.mainScreen, state.phoneNumber],
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
        appBar: AppBar(
          title: Text(ManagerStrings.login),
        ),
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
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  var controller = context.read<LoginBloc>();
                  return CustomEnterPhoneNumberFiled(
                    errorText: state is LoginFailure ? state.message : null,
                    formKey: controller.formKey,
                    codesCountry: AppConstants.countriesCodes,
                    phone: controller.phoneController,
                    selectedCodeCountry: (state is SelectedCodeCountry)
                        ? state.selectedValue
                        : AppConstants.countriesCodes[0].id.toString(),
                    function: (value) =>
                        controller.add(SelectCodeCountry(value)),
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w20,
                  end: ManagerWidth.w20,
                  top: ManagerHeight.h12,
                  bottom: ManagerHeight.h55,
                ),
                child: CustomButton(
                  onPressed: () =>
                      context.read<LoginBloc>().add(LoginProcess()),
                  color: context.theme.primaryColor,
                  child: Text(
                    ManagerStrings.loginButton,
                    style: context.textTheme.labelLarge,
                  ),
                ),
              ),
              CustomRichText(
                recognizer: context.read<LoginBloc>().tapGestureRecognizer,
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
