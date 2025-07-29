part of 'shop_products_bloc.dart';

sealed class ShopProductsEvent {}

class GetAllProducts extends ShopProductsEvent {
  GetAllProducts({
    required this.departmentName,
    this.loadMore = false,
  });

  final String departmentName;
  final bool loadMore;
}

