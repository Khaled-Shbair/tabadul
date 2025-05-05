import '/config/all_imports.dart';

class CustomImageAnimation extends StatelessWidget {
  const CustomImageAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeIn(
        delay: const Duration(seconds: 2),
        child: SvgPicture.asset(
          ManagerAssets.addedPersonalInformationSuccessfully,
          width: ManagerWidth.infinity,
        ),
      ),
    );
  }
}

class CustomPartyDecoration extends StatelessWidget {
  const CustomPartyDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(seconds: 3),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h35,
          start: ManagerWidth.w20,
          end: ManagerWidth.w20,
        ),
        child: SvgPicture.asset(
          ManagerAssets.partyDecoration,
          width: ManagerWidth.infinity,
          height: ManagerHeight.h344,
        ),
      ),
    );
  }
}
