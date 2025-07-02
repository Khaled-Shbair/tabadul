import '/config/all_imports.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    required this.product,
    required this.nameDepartment,
    required this.tableName,
    super.key,
  });

  final String nameDepartment;
  final String tableName;
  final ProductResponse product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerStrings.productDetails,
        functionLeadingButton: () {
          Navigator.pop(context);
          disposeBuyProduct();
        },
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w38,
          end: ManagerWidth.w36,
          top: ManagerHeight.h10,
        ),
        primary: false,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: ManagerWidth.w14,
              crossAxisSpacing: ManagerHeight.h14,
              childAspectRatio: ManagerWidth.w136 / ManagerHeight.h153,
            ),
            itemCount: product.images!.length,
            itemBuilder: (context, index) {
              return CustomImageOfProduct(
                imageUrl: product.images![index],
              );
            },
          ),
          verticalSpace(ManagerHeight.h30),
          Column(
            children: [
              Row(
                children: [
                  CustomBoxOfProductDetails(text: ManagerStrings.name),
                  horizontalSpace(ManagerWidth.w10),
                  Expanded(
                    child: CustomBoxOfProductDetails(
                      alignment: AlignmentDirectional.centerStart,
                      start: ManagerWidth.w10,
                      end: ManagerWidth.w10,
                      text: product.name ?? '',
                    ),
                  ),
                ],
              ),
              verticalSpace(ManagerHeight.h10),
              Row(
                children: [
                  CustomBoxOfProductDetails(text: ManagerStrings.price),
                  horizontalSpace(ManagerWidth.w10),
                  Expanded(
                    child: CustomBoxOfProductDetails(
                      alignment: AlignmentDirectional.centerStart,
                      start: ManagerWidth.w10,
                      text: '${product.price} ${ManagerStrings.shekel}',
                    ),
                  ),
                ],
              ),
              verticalSpace(ManagerHeight.h10),
              Row(
                children: [
                  CustomBoxOfProductDetails(text: ManagerStrings.description),
                  horizontalSpace(ManagerWidth.w10),
                  Expanded(
                    child: CustomBoxOfProductDetails(
                      start: ManagerWidth.w10,
                      end: ManagerWidth.w10,
                      alignment: AlignmentDirectional.centerStart,
                      text: product.description ?? '',
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(ManagerHeight.h30),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.readyToReceiveScreen,
                arguments: [
                  product.id,
                  tableName,
                ],
              );
            },
            child: Text(
              ManagerStrings.buyNow,
              style: context.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
