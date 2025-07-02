part of 'buy_product_bloc.dart';

sealed class BuyProductEvent {}

class BuyProductProcess extends BuyProductEvent {
  final String tableName;
  final String productId;

  BuyProductProcess(this.tableName, this.productId);
}
