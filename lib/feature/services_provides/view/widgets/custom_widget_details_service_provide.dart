import '/config/all_imports.dart';

class CustomWidgetDetailsServiceProvide extends StatelessWidget {
  const CustomWidgetDetailsServiceProvide(
    this.text, {
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.size,
    this.maxLines,
    super.key,
  });
  final String text;
  final double? size;
  final CrossAxisAlignment crossAxisAlignment;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        CircleAvatar(
          radius: ManagerRadius.r10,
          backgroundColor: ManagerColors.primaryColor,
          child: CircleAvatar(
            radius: ManagerRadius.r4,
            backgroundColor: ManagerColors.antiFlashWhite,
          ),
        ),
        horizontalSpace(ManagerWidth.w12),
        Text(
          text,
          textAlign: TextAlign.start,
          style: context.textTheme.bodyLarge,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
