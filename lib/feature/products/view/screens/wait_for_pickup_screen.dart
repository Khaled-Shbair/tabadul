import '/config/all_imports.dart';

class WaitForPickupScreen extends StatelessWidget {
  const WaitForPickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        functionLeadingButton: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w37,
          end: ManagerWidth.w37,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ManagerAssets.waitToReceive,
              height: ManagerHeight.h236,
              width: ManagerWidth.w236,
            ),
            verticalSpace(ManagerHeight.h22),
            Text(
              ManagerStrings.timeSelectedSuccessfully,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineLarge,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeight.h34,
                start: ManagerWidth.w90,
                end: ManagerWidth.w90,
              ),
              child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  ManagerStrings.cancel,
                  style: context.textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
