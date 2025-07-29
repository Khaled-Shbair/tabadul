import '/config/all_imports.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w37,
            end: ManagerWidth.w36,
            top: ManagerHeight.h30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ManagerAssets.logo,
                height: ManagerHeight.h29,
                width: ManagerWidth.w68,
              ),
              BlocBuilder<OnBoardingBloc, OnBoardingState>(
                builder: (context, state) {
                  var controller = context.read<OnBoardingBloc>();
                  return Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (v) =>
                            controller.add(PageChangedEvent(v)),
                        controller: controller.pageController,
                        reverse: false,
                        children: [
                          CustomFirstPageOnBoarding(
                            onPressed: () =>
                                controller.add(ButtonPressedEvent(context)),
                          ),
                          CustomSecondPageOnBoarding(
                            onPressed: () =>
                                controller.add(ButtonPressedEvent(context)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
