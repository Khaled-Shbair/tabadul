import '/config/all_imports.dart';

class CustomBoxOfProductDetails extends StatelessWidget {
  const CustomBoxOfProductDetails({
    super.key,
    required this.text,
    this.width,
    this.start,
    this.end,
    this.alignment,
  });
  final String text;
  final double? width;
  final double? start;
  final double? end;
  final AlignmentDirectional? alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: start ?? ManagerWidth.w3,
        end: end ?? ManagerWidth.w3,
        bottom: ManagerHeight.h6,
      ),
      alignment: alignment ?? AlignmentDirectional.center,
      height: ManagerHeight.h38,
      width: width ?? ManagerWidth.w69,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(ManagerRadius.r4),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          text,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
