import '/config/all_imports.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({
    required this.onPressed,
    super.key,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: const Duration(seconds: 4),
      from: 5,
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: FloatingActionButton(
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(
            Icons.arrow_right_alt,
            textDirection: TextDirection.ltr,
            size: ManagerIconsSizes.i30,
            color: ManagerColors.white,
          ),
        ),
      ),
    );
  }
}
