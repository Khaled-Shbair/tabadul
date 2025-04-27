import '/config/all_imports.dart';

class SecurityCodeScreen extends StatelessWidget {
  const SecurityCodeScreen({
    required this.route,
    required this.phoneNumber,
    super.key,
  });

  final String route;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SecurityCodeBloc, SecurityCodeState>(
      listener: (_, state) async {
        if (state is VerifiedSecurityCodeSuccessfully) {
          context.pop();
          context.pushReplacementNamed(route);
          disposeSecurityCode();
        }
        if (state is VerifiedSecurityCodeLoading) {
          customLoading(context);
        }
        if (state is VerifiedSecurityCodeFailed &&
            state.message != ManagerStrings.pleaseEnterCodeCorrectly) {
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: ManagerStrings.securityCode,
          iconLeading: Icons.arrow_back_ios_new,
          functionLeadingButton: () {
            if (context.mounted) {
              context.pop();
              disposeSecurityCode();
            }
          },
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsetsDirectional.only(
            top: ManagerHeight.h76,
            start: ManagerWidth.w58,
            end: ManagerWidth.w56,
            bottom: ManagerHeight.h10,
          ),
          children: [
            SvgPicture.asset(
              ManagerAssets.securityCode,
              height: ManagerHeight.h208,
              width: ManagerWidth.w183,
            ),
            verticalSpace(ManagerHeight.h25),
            Text(
              ManagerStrings.securityCodeSubtitle,
              textAlign: TextAlign.center,
              style: context.textTheme.displayMedium,
            ),
            verticalSpace(ManagerHeight.h24),
            BlocBuilder<SecurityCodeBloc, SecurityCodeState>(
              builder: (_, state) {
                int timer = 45;
                bool canResend = false;
                String errorMessage = '';
                if (state is SecurityCodeTimerState) {
                  timer = state.seconds;
                  canResend = state.canResend;
                }
                if (state is VerifiedSecurityCodeFailed) {
                  errorMessage = state.message;
                }
                return CustomFiledSecurityCode(
                  phoneNumber: phoneNumber,
                  timer: timer.toString().padLeft(2, '0'),
                  canSend: canResend,
                  errorMessage: errorMessage,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
