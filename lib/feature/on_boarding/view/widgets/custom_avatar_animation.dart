import '/config/all_imports.dart';

class CustomManAvatarAnimation extends StatelessWidget {
  const CustomManAvatarAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      from: 250,
      delay: const Duration(seconds: 2),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h15,
          start: ManagerWidth.w22,
        ),
        child: SvgPicture.asset(
          ManagerAssets.man,
          height: ManagerHeight.h162,
        ),
      ),
    );
  }
}

class CustomWomanAvatarAnimation extends StatelessWidget {
  const CustomWomanAvatarAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      from: 250,
      delay: const Duration(seconds: 2),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h24,
          start: ManagerWidth.w22,
        ),
        child: SvgPicture.asset(
          ManagerAssets.woman,
          height: ManagerHeight.h154,
        ),
      ),
    );
  }
}
