part of 'buy_product_bloc.dart';

sealed class BuyProductState {}

class BuyProductInitial extends BuyProductState {}

class BuyProductFailure extends BuyProductState {
  BuyProductFailure(this.message);
  final String message;
}

class BuyProductSuccessfully extends BuyProductState {}

class BuyProductLoading extends BuyProductState {}
