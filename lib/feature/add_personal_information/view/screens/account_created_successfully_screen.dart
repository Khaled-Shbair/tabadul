import '/config/all_imports.dart';

class AccountCreatedSuccessfullyScreen extends StatelessWidget {
  const AccountCreatedSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w38,
          end: ManagerWidth.w37,
          bottom: ManagerHeight.h83,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  CustomPartyDecoration(),
                  CustomImageAnimation(),
                ],
              ),
            ),
            verticalSpace(ManagerHeight.h35),
            Align(
              alignment: AlignmentDirectional.center,
              child: FadeInUp(
                delay: const Duration(seconds: 4),
                child: Text(
                  ManagerStrings.theAccountHasBeenCreatedSuccessfully,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge,
                ),
              ),
            ),
            verticalSpace(ManagerHeight.h32),
            FadeInLeft(
              delay: const Duration(seconds: 5),
              child: FloatingActionButton(
                onPressed: () =>
                    context.pushNamedAndRemoveAllUntil(Routes.mainScreen),
                child: Icon(
                  Icons.arrow_right_alt,
                  textDirection: TextDirection.ltr,
                  color: context.theme.colorScheme.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
