import '/config/all_imports.dart';

class CustomAddProductDepartment extends StatelessWidget {
  const CustomAddProductDepartment({
    required this.nameDepartment,
    required this.tableName,
    super.key,
  });
  final String nameDepartment;
  final String tableName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h52,
        ),
        children: [
          SvgPicture.asset(
            ManagerAssets.addProduct,
            height: ManagerHeight.h350,
            width: ManagerWidth.w163,
          ),
          verticalSpace(ManagerHeight.h52),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.addProductScreen,
                arguments: [tableName],
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: ManagerHeight.h35,
                  width: ManagerWidth.w33,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(ManagerRadius.r4),
                  ),
                  child: Icon(
                    Icons.add,
                    color: context.theme.colorScheme.surface,
                    size: ManagerIconsSizes.i24,
                  ),
                ),
                horizontalSpace(ManagerWidth.w4),
                Container(
                  height: ManagerHeight.h35,
                  width: ManagerWidth.w106,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(ManagerRadius.r4),
                  ),
                  child: Text(
                    ManagerStrings.addProduct,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
