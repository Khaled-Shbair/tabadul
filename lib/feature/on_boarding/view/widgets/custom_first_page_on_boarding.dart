import '/config/all_imports.dart';

class CustomFirstPageOnBoarding extends StatelessWidget {
  const CustomFirstPageOnBoarding({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(ManagerHeight.h107),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: ManagerHeight.h190,
              alignment: AlignmentDirectional.topCenter,
              child: SvgPicture.asset(
                ManagerAssets.arrows,
                height: ManagerHeight.h142,
              ),
            ),
            SvgPicture.asset(
              ManagerAssets.flowers,
              height: ManagerHeight.h156,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPhoneLeftAnimation(),
                horizontalSpace(ManagerWidth.w54),
                CustomPhoneRightAnimation(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomManAvatarAnimation(),
                CustomWomanAvatarAnimation(),
              ],
            ),
          ],
        ),
        CustomTitleOnBoarding(title: ManagerStrings.fairReturnPolicy),
        CustomSubTitleOnBoarding(
            subTitle: ManagerStrings.subTitleOnBoardingOne),
        CustomSlider(isFirstPage: true),
        verticalSpace(ManagerHeight.h36),
        CustomButtonOnBoarding(onPressed: onPressed),
      ],
    );
  }
}
