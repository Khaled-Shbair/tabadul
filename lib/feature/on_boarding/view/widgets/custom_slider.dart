import '/config/all_imports.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    required this.isFirstPage,
    super.key,
  });

  final bool isFirstPage;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(seconds: 3),
      from: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _slider(isFirstPage, context),
          horizontalSpace(ManagerWidth.w11),
          _slider(isFirstPage == true ? false : true, context),
        ],
      ),
    );
  }

  Widget _slider(bool isFirstPage, BuildContext context) {
    return CircleAvatar(
      radius: ManagerRadius.r4,
      backgroundColor: isFirstPage
          ? context.theme.primaryColor
          : context.theme.colorScheme.onTertiary,
    );
  }
}
