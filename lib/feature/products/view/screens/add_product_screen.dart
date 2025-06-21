import '/config/all_imports.dart';

class AddProductScreen extends StatelessWidget with CustomToast {
  const AddProductScreen({
    required this.tableName,
    super.key,
  });
  final String tableName;

  @override
  Widget build(BuildContext context) {
    var controller = context.read<AddProductBloc>();
    return BlocListener<AddProductBloc, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          if (state.messageError != ManagerStrings.pleaseAddProductImage) {
            Navigator.of(context, rootNavigator: true).pop();
            showToast(message: state.messageError, context: context);
          } else {
            showToast(message: state.messageError, context: context);
          }
        }
        if (state is AddProductLoading) {
          customLoading(context);
        }
        if (state is AddProductSuccessfully) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushReplacementNamed(
              context, Routes.addedProductSuccessfullyScreen);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: ManagerStrings.addProduct,
          functionLeadingButton: () {
            Navigator.pop(context);
            disposeAddProduct();
          },
        ),
        body: Form(
          key: controller.formKey,
          child: ListView(
            primary: false,
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w38,
              end: ManagerWidth.w36,
              top: ManagerHeight.h20,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<AddProductBloc, AddProductState>(
                    builder: (context, state) {
                      return CustomBoxOfAddPhotoOfProduct(
                        eventBuilder: (i) => AddProductImageTwo(i),
                        click: true,
                        fileImage: state.imageTwo,
                      );
                    },
                  ),
                  horizontalSpace(ManagerWidth.w20),
                  BlocBuilder<AddProductBloc, AddProductState>(
                    builder: (context, state) {
                      return CustomBoxOfAddPhotoOfProduct(
                        eventBuilder: (i) => AddProductImageOne(i),
                        click: true,
                        fileImage: state.imageOne,
                      );
                    },
                  ),
                ],
              ),
              verticalSpace(ManagerHeight.h20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<AddProductBloc, AddProductState>(
                    builder: (context, state) {
                      return CustomBoxOfAddPhotoOfProduct(
                        eventBuilder: (i) => AddProductImageThree(i),
                        click: true,
                        fileImage: state.imageThree,
                      );
                    },
                  ),
                  horizontalSpace(ManagerWidth.w20),
                  BlocBuilder<AddProductBloc, AddProductState>(
                    builder: (context, state) {
                      return CustomBoxOfAddPhotoOfProduct(
                        eventBuilder: (i) => AddProductImageFour(i),
                        click: true,
                        fileImage: state.imageFour,
                      );
                    },
                  ),
                ],
              ),
              verticalSpace(ManagerHeight.h30),
              CustomTextField(
                helperText: ' ',
                validator: (v) => Validator.productNameValidator(v),
                keyboardType: TextInputType.text,
                textEditingController: controller.productName,
                hintText: ManagerStrings.nameProduct,
                hintMaxLines: 1,
              ),
              // verticalSpace(ManagerHeight.h20),
              CustomTextField(
                helperText: ' ',
                validator: (v) => Validator.priceValidator(v),
                keyboardType: TextInputType.number,
                textEditingController: controller.price,
                hintText: ManagerStrings.price,
                hintMaxLines: 1,
              ),
              // verticalSpace(ManagerHeight.h20),
              CustomTextField(
                helperText: ' ',
                validator: (v) => Validator.descriptionOfProductValidator(v),
                keyboardType: TextInputType.text,
                maxLines: 5,
                hintText: ManagerStrings.descriptionOfProduct,
                textEditingController: controller.descriptionOfProduct,
                hintMaxLines: 1,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w20,
                  end: ManagerWidth.w20,
                  top: ManagerHeight.h10,
                ),
                child: CustomButton(
                  onPressed: () {
                    controller.add(AddProductProcess(tableName));
                  },
                  child: Text(
                    ManagerStrings.add,
                    style: context.textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
