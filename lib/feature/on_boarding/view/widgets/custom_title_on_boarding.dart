import '/config/all_imports.dart';

class CustomTitleOnBoarding extends StatelessWidget {
  const CustomTitleOnBoarding({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: ManagerHeight.h53,
        bottom: ManagerHeight.h8,
      ),
      child: FadeInLeft(
        from: 20,
        delay: const Duration(seconds: 3),
        child: Text(
          title,
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
