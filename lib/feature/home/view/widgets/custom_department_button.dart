import '/config/all_imports.dart';

class CustomDepartmentBox extends StatelessWidget {
  const CustomDepartmentBox({
    super.key,
    required this.pathImage,
    required this.nameDepartment,
  });

  final String nameDepartment;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.addAndBuyScreen, arguments: nameDepartment);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
          boxShadow: [
            BoxShadow(
              color: context.theme.colorScheme.shadow,
              offset: Offset(ManagerWidth.w0, ManagerHeight.h3),
              blurRadius: ManagerRadius.r6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              pathImage,
              height: ManagerHeight.h45,
              width: ManagerWidth.w45,
            ),
            verticalSpace(ManagerHeight.h10),
            Text(nameDepartment, style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
