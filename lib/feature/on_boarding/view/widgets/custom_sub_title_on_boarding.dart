import '/config/all_imports.dart';

class CustomSubTitleOnBoarding extends StatelessWidget {
  const CustomSubTitleOnBoarding({required this.subTitle, super.key});

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: ManagerHeight.h30,
      ),
      child: SizedBox(
        width: ManagerWidth.infinity,
        height: ManagerHeight.h84,
        child: FadeInDown(
          delay: const Duration(seconds: 4),
          from: 20,
          child: Text(
            subTitle,
            maxLines: 3,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
