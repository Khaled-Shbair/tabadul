import '/config/all_imports.dart';

class CustomErrorMessageAnimation extends StatelessWidget {
  const CustomErrorMessageAnimation({
    required this.message,
    this.paddingStart,
    super.key,
  });

  final String message;
  final double? paddingStart;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: paddingStart ?? ManagerWidth.w22,
          top: ManagerHeight.h15,
          bottom: ManagerHeight.h15,
        ),
        child: Text(
          message,
          style: context.textTheme.bodySmall,
        ),
      ),
    );
  }
}
