import '/config/all_imports.dart';

class CustomSecondPageOnBoarding extends StatelessWidget {
  const CustomSecondPageOnBoarding({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            FadeIn(
              delay: const Duration(seconds: 2),
              child: Center(
                child: SvgPicture.asset(
                  ManagerAssets.backgroundDeliveryDriverAvatar,
                  height: ManagerHeight.h201,
                ),
              ),
            ),
            SvgPicture.asset(
              ManagerAssets.deliveryDriverAvatar,
              height: ManagerHeight.h305,
            ),
          ],
        ),
        CustomTitleOnBoarding(title: ManagerStrings.fastDelivery),
        CustomSubTitleOnBoarding(
          subTitle: ManagerStrings.subTitleOnBoardingTwo,
        ),
        CustomSlider(isFirstPage: false),
        verticalSpace(ManagerHeight.h36),
        CustomButtonOnBoarding(onPressed: onPressed),
      ],
    );
  }
}
