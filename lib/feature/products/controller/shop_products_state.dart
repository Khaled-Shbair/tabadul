part of 'shop_products_bloc.dart';

sealed class ShopProductsState {}

class ProductsLoading extends ShopProductsState {}

class MoreProductsLoading extends ShopProductsState {}

class GetProductsSuccessfully extends ShopProductsState {
  List<ProductResponse> products;
  GetProductsSuccessfully(this.products);
}

class GetProductsFailure extends ShopProductsState {
  final String message;

  GetProductsFailure(this.message);
}
