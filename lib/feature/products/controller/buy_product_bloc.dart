import '/config/all_imports.dart';

part 'buy_product_event.dart';
part 'buy_product_state.dart';

class BuyProductBloc extends Bloc<BuyProductEvent, BuyProductState> {
  BuyProductBloc(this._repo) : super(BuyProductInitial()) {
    on<BuyProductProcess>(buyProductProcess);
  }
  final ProductsRepo _repo;
  Future<void> buyProductProcess(BuyProductProcess event, Emitter emit) async {
    emit(BuyProductLoading());

    (await _repo.buyProduct(BuyProductRequest(
      tableName: event.tableName,
      productId: event.productId,
    )))
        .fold(
      (l) => emit(BuyProductFailure(l.message)),
      (r) => emit(BuyProductSuccessfully()),
    );
  }
}
