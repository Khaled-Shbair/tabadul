import '/config/all_imports.dart';

class CustomShopProductsTap extends StatelessWidget with CustomToast {
  CustomShopProductsTap({
    required this.nameDepartment,
    required this.tableName,
    super.key,
  });

  final String nameDepartment;
  final String tableName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w37,
        end: ManagerWidth.w37,
        top: ManagerHeight.h25,
      ),
      child: BlocConsumer<ShopProductsBloc, ShopProductsState>(
        listener: (context, state) {
          if (state is GetProductsFailure &&
              state.message != ManagerStrings.noData) {
            showToast(message: state.message, context: context);
          }
        },
        builder: (context, state) {
          if (state is GetProductsSuccessfully ||
              state is MoreProductsLoading) {
            final products = state is GetProductsSuccessfully
                ? state.products
                : (state as GetProductsSuccessfully).products;

            final isLoadingMore = state is MoreProductsLoading;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    CircleAvatar(
                      radius: ManagerRadius.r10,
                      backgroundColor: context.theme.colorScheme.secondary,
                    ),
                    Text(
                      ' $nameDepartment',
                      style: context.textTheme.headlineLarge,
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsetsDirectional.only(top: ManagerHeight.h20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: ManagerWidth.w136 / ManagerHeight.h154,
                    mainAxisSpacing: ManagerHeight.h16,
                    crossAxisSpacing: ManagerWidth.w14,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        Routes.productDetailsScreen,
                        arguments: [
                          product,
                          nameDepartment,
                          tableName,
                        ],
                      ),
                      child: Container(
                        width: ManagerWidth.w136,
                        height: ManagerHeight.h154,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(ManagerRadius.r5),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                              product.images?[0] ?? '',
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                if (isLoadingMore)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: ManagerHeight.h10),
                    child: Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            );
          } else if (state is ProductsLoading) {
            return CustomLoading();
          } else {
            return Center(
              child: Text(
                ManagerStrings.noData,
                style: context.textTheme.headlineLarge,
              ),
            );
          }
        },
      ),
    );
  }
}
