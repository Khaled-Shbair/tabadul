import '/config/all_imports.dart';

class CustomAppearLogo extends StatelessWidget {
  const CustomAppearLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      onFinish: (direction) {
        Navigator.pushReplacementNamed(
          context,
          RouteMiddleware.goAfterSplash(),
        );
      },
      from: MediaQuery.of(context).size.height / 2,
      delay: const Duration(seconds: 4),
      child: Center(
        child: SvgPicture.asset(
          ManagerAssets.splashLogo,
          alignment: AlignmentDirectional.bottomCenter,
        ),
      ),
    );
  }
}
