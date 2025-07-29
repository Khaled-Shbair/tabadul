import '/config/all_imports.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<CreateAccountBloc>();

    return BlocListener<CreateAccountBloc, CreateAccountState>(
      listener: (_, state) {
        if (state is CreateAccountSuccessfully) {
          context.pop();
          context.pushNamed(
            Routes.securityCodeScreen,
            arguments: [Routes.addPersonalInformationScreen, state.phoneNumber],
          );
        }

        if (state is CreateAccountLoading) {
          customLoading(context);
        }
        if (state is CreateAccountFailure) {
          context.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: ManagerStrings.createAccount,
          iconLeading: Icons.arrow_back_ios_new,
          functionLeadingButton: () {
            context.pop();
            disposeCreateAccount();
          },
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
                ManagerAssets.createAccount,
                height: ManagerHeight.h196,
                width: ManagerWidth.w221,
              ),
              verticalSpace(ManagerHeight.h63),
              Form(
                key: controller.formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocSelector<CreateAccountBloc, CreateAccountState,
                        String?>(
                      selector: (state) => (state is CreateAccountFailure)
                          ? state.message
                          : null,
                      builder: (context, errorMessage) {
                        return CustomEnterPhoneNumberFiled(
                          errorMessage: errorMessage,
                          controller: controller.phoneController,
                          onFieldSubmitted: (v) =>
                              controller.add(CreateAccountProcess()),
                        );
                      },
                    ),
                    horizontalSpace(ManagerWidth.w8),
                    BlocSelector<CreateAccountBloc, CreateAccountState, String>(
                      selector: (state) => (state is SelectedCodeOfCountry)
                          ? state.selectedValue
                          : AppConstants.countriesCodes[0].id.toString(),
                      builder: (context, selectedCodeCountry) {
                        return CustomMenuChooseCodeCountry(
                          function: (value) =>
                              controller.add(SelectCodeOfCountry(value)),
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
                  onPressed: () => controller.add(CreateAccountProcess()),
                  textButton: ManagerStrings.createAccount,
                ),
              ),
              CustomRichText(
                recognizer: controller.tapGestureRecognizer
                  ..onTap = () {
                    context.pop();
                    disposeCreateAccount();
                  },
                title: ManagerStrings.alreadyHaveAnAccount,
                subTitle: ManagerStrings.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
