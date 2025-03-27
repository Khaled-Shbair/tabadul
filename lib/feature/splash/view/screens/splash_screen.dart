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
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Stack(
        children: [
          CustomCircleAnimation(
            opacity: .45,
            value: ManagerRadius.r100,
            milliseconds: 1500,
          ),
          CustomCircleAnimation(
            opacity: .39,
            value: ManagerRadius.r200,
            milliseconds: 1800,
          ),
          CustomCircleAnimation(
            opacity: .33,
            value: ManagerRadius.r300,
            milliseconds: 2100,
          ),
          CustomCircleAnimation(
            opacity: .27,
            value: ManagerRadius.r400,
            milliseconds: 2400,
          ),
          CustomCircleAnimation(
            opacity: .21,
            value: ManagerRadius.r500,
            milliseconds: 2700,
          ),
          CustomCircleAnimation(
            opacity: .15,
            value: ManagerRadius.r600,
            milliseconds: 3000,
          ),
          CustomCircleAnimation(
            opacity: .12,
            value: ManagerRadius.r700,
            milliseconds: 3300,
          ),
          CustomCircleAnimation(
            opacity: .10,
            value: ManagerRadius.r800,
            milliseconds: 3600,
          ),
          CustomAppearLogo(),
        ],
      ),
    );
  }
}
