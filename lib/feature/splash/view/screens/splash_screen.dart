import '/config/all_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initModule();
    Future.delayed(
      const Duration(seconds: 6),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(
            context,
            RouteMiddleware.goAfterSplash(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.primaryColor,
        body: Padding(
          padding: EdgeInsetsDirectional.only(
            top: ManagerHeight.h15,
          ),
          child: Stack(
            children: [
              CustomCircleAnimation(
                opacity: .52,
                milliseconds: 1200,
                value: ManagerRadius.r40,
                width: ManagerWidth.w18,
              ),
              CustomCircleAnimation(
                opacity: .46,
                milliseconds: 1500,
                value: ManagerRadius.r90,
                width: ManagerWidth.w20,
              ),
              CustomCircleAnimation(
                opacity: .40,
                milliseconds: 1800,
                width: ManagerWidth.w22,
                value: ManagerRadius.r140,
              ),
              CustomCircleAnimation(
                opacity: .34,
                milliseconds: 2100,
                width: ManagerWidth.w24,
                value: ManagerRadius.r190,
              ),
              CustomCircleAnimation(
                opacity: .28,
                milliseconds: 2400,
                width: ManagerWidth.w26,
                value: ManagerRadius.r240,
              ),
              CustomCircleAnimation(
                opacity: .22,
                milliseconds: 2700,
                width: ManagerWidth.w28,
                value: ManagerRadius.r290,
              ),
              CustomCircleAnimation(
                opacity: .16,
                milliseconds: 3000,
                width: ManagerWidth.w30,
                value: ManagerRadius.r340,
              ),
              CustomCircleAnimation(
                opacity: .10,
                milliseconds: 3300,
                width: ManagerWidth.w32,
                value: ManagerRadius.r390,
              ),
              CustomAppearLogo(),
            ],
          ),
        ),
      ),
    );
  }
}
