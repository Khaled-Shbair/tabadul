import '/config/all_imports.dart';

class LogoutScreen extends StatelessWidget with CustomToast {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<LogoutBloc>();
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          customLoading(context);
        }
        if (state is LogoutSuccessfully) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginScreen, (route) => false);
          disposeLogout();
        }
        if (state is LogoutFailure) {
          Navigator.pop(context);
          showToast(message: state.message, context: context);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: ManagerStrings.logout,
          functionLeadingButton: () {
            Navigator.pop(context);
            disposeLogout();
          },
          functionActionButton: () {
            ZoomDrawer.of(context)?.open();
          },
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
            top: ManagerHeight.h162,
            start: ManagerWidth.w50,
            end: ManagerWidth.w48,
          ),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                height: ManagerHeight.h260,
                width: double.infinity,
                margin: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w45,
                  end: ManagerWidth.w45,
                ),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(ManagerRadius.r30),
                ),
              ),
              Container(
                height: ManagerHeight.h250,
                width: double.infinity,
                margin: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w25,
                  end: ManagerWidth.w25,
                ),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(ManagerRadius.r30),
                ),
              ),
              Container(
                height: ManagerHeight.h240,
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w30,
                  end: ManagerWidth.w30,
                  top: ManagerHeight.h37,
                  bottom: ManagerHeight.h43,
                ),
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(ManagerRadius.r30),
                ),
                child: Column(
                  children: [
                    Text(
                      ManagerStrings.doYouWantLogoutOfYourAccount,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleSmall,
                    ),
                    verticalSpace(ManagerHeight.h20),
                    CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                        disposeLogout();
                      },
                      color: context.theme.colorScheme.surface,
                      borderRadius: ManagerRadius.r4,
                      child: Text(
                        ManagerStrings.cancel,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                    verticalSpace(ManagerHeight.h7),
                    CustomButton(
                      onPressed: () => controller.add(LogoutProcess()),
                      color: context.theme.unselectedWidgetColor,
                      borderRadius: ManagerRadius.r4,
                      elevation: 0,
                      side: BorderSide(
                        color: context.theme.colorScheme.surface,
                        width: 1.5,
                      ),
                      textButton: ManagerStrings.logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
