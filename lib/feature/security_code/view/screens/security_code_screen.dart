import 'package:tabadul/feature/security_code/view/widgets/custom_timer.dart';

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
          context.pushReplacementNamed(route, arguments: phoneNumber);
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
            CustomFiledSecurityCode(phoneNumber: phoneNumber),
            BlocSelector<SecurityCodeBloc, SecurityCodeState, String?>(
              selector: (state) =>
                  state is VerifiedSecurityCodeFailed ? state.message : null,
              builder: (context, errorMessage) {
                if (errorMessage != null) {
                  return CustomErrorMessageAnimation(
                    message: errorMessage,
                    paddingStart: ManagerWidth.w5,
                  );
                } else {
                  return SizedBox(
                    height: ManagerHeight.h49,
                    width: ManagerWidth.infinity,
                  );
                }
              },
            ),
            BlocProvider<TimerBloc>(
              create: (context) => instance<TimerBloc>()
                ..add(StartTimer(AppConstants.timeoutVerifyPhoneNumber)),
              child: BlocSelector<TimerBloc, TimerState, bool>(
                selector: (state) => state is TimerRunComplete,
                builder: (context, canResend) {
                  return CustomButton(
                    onPressed: canResend
                        ? () {
                            context
                                .read<SecurityCodeBloc>()
                                .add(ResendSecurityCode(phoneNumber));
                            context.read<TimerBloc>().add(StartTimer(
                                AppConstants.timeoutVerifyPhoneNumber));
                          }
                        : null,
                    color: context.theme.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ManagerStrings.resendCode,
                          style: context.textTheme.labelLarge?.copyWith(
                            color: canResend
                                ? context.theme.colorScheme.surface
                                : context.theme.primaryColor,
                          ),
                        ),
                        horizontalSpace(ManagerWidth.w10),
                        CustomTimer(canSend: canResend),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
