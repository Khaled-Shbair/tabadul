import '/config/all_imports.dart';

part 'shop_products_event.dart';

part 'shop_products_state.dart';

class ShopProductsBloc extends Bloc<ShopProductsEvent, ShopProductsState> {
  ShopProductsBloc(this._repo, this._internetConnection)
      : super(ProductsLoading()) {
    on<GetAllProducts>(_getAllProducts);
    scrollController.addListener(_onScroll);
    _monitorConnection();
  }
  late String _departmentName;
  final ProductsRepo _repo;
  DocumentSnapshot? _lastDocument;

  StreamSubscription<InternetStatus>? _internetSubscription;

  final InternetConnection _internetConnection;
  final ScrollController scrollController = ScrollController();
  bool _productsLoadingFailure = false;
  bool loaded = false;

  // Trigger load more products when reaching near the bottom
  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (state is GetProductsSuccessfully) {
        add(GetAllProducts(departmentName: _departmentName, loadMore: true));
      }
    }
  }

  // Trigger re-load products when return connect internet
  void _monitorConnection() {
    _internetSubscription = _internetConnection.onStatusChange.listen(
      (status) {
        debugPrint('monitor connection:${status == InternetStatus.connected}');
        if (status == InternetStatus.connected) {
          if (_productsLoadingFailure) {
            add(GetAllProducts(departmentName: _departmentName));
            _productsLoadingFailure = false;
          }
        }
      },
    );
  }

  Future<void> _getAllProducts(GetAllProducts event, Emitter emit) async {
    _departmentName = event.departmentName;
    List<ProductResponse> oldProducts = [];
    if (event.loadMore) {
      if (state is GetProductsSuccessfully) {
        oldProducts = (state as GetProductsSuccessfully).products;
        emit(MoreProductsLoading());
      } else {
        return;
      }
    } else {
      emit(ProductsLoading());
    }

    final result = await _repo.getProducts(
      GetProductsRequest(event.departmentName, _lastDocument),
    );

    result.fold(
      (failure) => emit(GetProductsFailure(failure.message)),
      (response) {
        _lastDocument = response.lastDocument;
        final newProducts = response.products;

        final allProducts = [...oldProducts, ...newProducts];
        emit(GetProductsSuccessfully(allProducts));
      },
    );
  }

  @override
  Future<void> close() async {
    _internetSubscription?.cancel();
    scrollController.dispose();
    return super.close();
  }
}
