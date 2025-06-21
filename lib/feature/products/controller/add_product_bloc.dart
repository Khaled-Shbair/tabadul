import '/config/all_imports.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc(this._repo) : super(AddProductInitial()) {
    on<AddProductProcess>(addProductProcess);
    on<AddProductImageOne>(addProductImageOne);
    on<AddProductImageTwo>(addProductImageTwo);
    on<AddProductImageThree>(addProductImageThree);
    on<AddProductImageFour>(addProductImageFour);
  }

  final ProductsRepo _repo;
  final TextEditingController descriptionOfProduct = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController productName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addProductProcess(AddProductProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      if (state.imageOne != null &&
          state.imageTwo != null &&
          state.imageThree != null &&
          state.imageFour != null) {
        emit(AddProductLoading(
          imageOne: state.imageOne,
          imageTwo: state.imageTwo,
          imageThree: state.imageThree,
          imageFour: state.imageFour,
        ));
        (await _repo.addProduct(AddProductRequest(
          tableName: event.tableName,
          productName: productName.text,
          description: descriptionOfProduct.text,
          price: double.tryParse(price.text) ?? 0,
          imageFilesList: [
            state.imageOne!,
            state.imageTwo!,
            state.imageThree!,
            state.imageFour!,
          ],
        )))
            .fold(
          (l) => emit(AddProductFailure(
            l.message,
            imageOne: state.imageOne,
            imageTwo: state.imageTwo,
            imageThree: state.imageThree,
            imageFour: state.imageFour,
          )),
          (r) => emit(AddProductSuccessfully()),
        );
      } else {
        emit(AddProductFailure(
          ManagerStrings.pleaseAddProductImage,
          imageOne: state.imageOne,
          imageTwo: state.imageTwo,
          imageThree: state.imageThree,
          imageFour: state.imageFour,
        ));
      }
    }
  }

  Future<void> addProductImageOne(
      AddProductImageOne event, Emitter emit) async {
    if (event.image.isNotEmpty) {
      emit(AddProductInitial(
        imageOne: File(event.image),
        imageTwo: state.imageTwo,
        imageThree: state.imageThree,
        imageFour: state.imageFour,
      ));
    } else {
      emit(AddedImageProductFailure(
        ManagerStrings.failedPickImage,
        imageOne: state.imageOne,
        imageTwo: state.imageTwo,
        imageThree: state.imageThree,
        imageFour: state.imageFour,
      ));
    }
  }

  Future<void> addProductImageTwo(
      AddProductImageTwo event, Emitter emit) async {
    if (event.image.isNotEmpty) {
      emit(AddProductInitial(
        imageOne: state.imageOne,
        imageTwo: File(event.image),
        imageThree: state.imageThree,
        imageFour: state.imageFour,
      ));
    } else {
      emit(AddedImageProductFailure(
        ManagerStrings.failedPickImage,
        imageOne: state.imageOne,
        imageTwo: state.imageTwo,
        imageThree: state.imageThree,
        imageFour: state.imageFour,
      ));
    }
  }

  Future<void> addProductImageThree(
      AddProductImageThree event, Emitter emit) async {
    if (event.image.isNotEmpty) {
      emit(AddProductInitial(
        imageOne: state.imageOne,
        imageTwo: state.imageTwo,
        imageThree: File(event.image),
        imageFour: state.imageFour,
      ));
    } else {
      emit(AddedImageProductFailure(
        ManagerStrings.failedPickImage,
        imageOne: state.imageOne,
        imageTwo: state.imageTwo,
        imageThree: state.imageThree,
        imageFour: state.imageFour,
      ));
    }
  }

  Future<void> addProductImageFour(
      AddProductImageFour event, Emitter emit) async {
    if (event.image.isNotEmpty) {
      emit(AddProductInitial(
        imageOne: state.imageOne,
        imageTwo: state.imageTwo,
        imageThree: state.imageThree,
        imageFour: File(event.image),
      ));
    } else {
      emit(AddedImageProductFailure(
        ManagerStrings.failedPickImage,
        imageOne: state.imageOne,
        imageTwo: state.imageTwo,
        imageThree: state.imageThree,
        imageFour: state.imageFour,
      ));
    }
  }
}
