
import '/config/all_imports.dart';

class CustomTimeBox extends StatelessWidget {
  const CustomTimeBox(this.time, {super.key});
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeight.h50,
      width: ManagerWidth.w42,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r5),
        color: context.theme.colorScheme.secondary,
      ),
      child: Text(
        time,
        style: TextStyle(
          color: context.theme.primaryColor,
          fontSize: ManagerFontsSizes.f30,
          fontWeight: ManagerFontWeight.medium,
        ),
      ),
    );
  }
}
