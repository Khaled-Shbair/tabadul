import '/config/all_imports.dart';

class CustomPersonalData extends StatelessWidget {
  const CustomPersonalData(
    this.title,
    this.data, {
    super.key,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        horizontalSpace(ManagerWidth.w26),
        Text(title, style: context.textTheme.displaySmall),
        Spacer(),
        Text(data, style: context.textTheme.displaySmall),
        Spacer(),
      ],
    );
  }
}
