import '/config/all_imports.dart';

class ShopAndAddProductsScreen extends StatefulWidget {
  const ShopAndAddProductsScreen({
    required this.nameDepartment,
    required this.tableName,
    super.key,
  });

  final String nameDepartment;
  final String tableName;

  @override
  State<ShopAndAddProductsScreen> createState() =>
      _ShopAndAddProductsScreenState();
}

class _ShopAndAddProductsScreenState extends State<ShopAndAddProductsScreen> {
  bool hasShopLoaded = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: '',
          functionLeadingButton: () {
            Navigator.of(context).pop();
            disposeShopAndAddProduct();
            disposeShopProducts();
            disposeAddProduct();
          },
        ),
        body: Column(
          children: [
            Container(
              height: ManagerHeight.h42,
              margin: EdgeInsetsDirectional.only(
                start: ManagerWidth.w38,
                end: ManagerWidth.w36,
                top: ManagerHeight.h30,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(ManagerRadius.r22),
              ),
              child: TabBar(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: ManagerWidth.w5,
                    vertical: ManagerHeight.h4,
                  ),
                  isScrollable: false,
                  unselectedLabelColor:
                      context.theme.tabBarTheme.unselectedLabelColor,
                  labelStyle: context.theme.tabBarTheme.labelStyle,
                  indicator: context.theme.tabBarTheme.indicator,
                  dividerColor: context.theme.tabBarTheme.dividerColor,
                  indicatorSize: context.theme.tabBarTheme.indicatorSize,
                  tabs: [Text(ManagerStrings.add), Text(ManagerStrings.buy)],
                  onTap: (value) {
                    if (value == 1 && !hasShopLoaded) {
                      context.read<ShopProductsBloc>().add(
                          GetAllProducts(departmentName: widget.tableName));
                      hasShopLoaded = true;
                    }
                  }),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CustomAddProductTap(
                      nameDepartment: widget.nameDepartment,
                      tableName: widget.tableName),
                  CustomShopProductsTap(
                      nameDepartment: widget.nameDepartment,
                      tableName: widget.tableName),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
