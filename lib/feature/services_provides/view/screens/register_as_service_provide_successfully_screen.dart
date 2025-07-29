import '/config/all_imports.dart';

class RegisterAsServiceProvideSuccessfullyScreen extends StatelessWidget {
  const RegisterAsServiceProvideSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        functionLeadingButton: () {
          Navigator.pushReplacementNamed(
              context, Routes.listServicesProvidesScreen);
        },
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w78,
          end: ManagerWidth.w62,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ManagerAssets.registeredAsProvideServiceSuccessfully,
              height: ManagerHeight.h246,
              width: ManagerWidth.w221,
            ),
            verticalSpace(ManagerHeight.h36),
            Text(
              ManagerStrings.registeredAsServiceProvideSuccessfully,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeight.h30,
                start: ManagerWidth.w50,
                end: ManagerWidth.w62,
              ),
              child: CustomButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.listServicesProvidesScreen);
                },
                child: Text(
                  ManagerStrings.okay,
                  style: context.textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
