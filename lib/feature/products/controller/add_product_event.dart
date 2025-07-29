part of 'add_product_bloc.dart';

sealed class AddProductEvent {}

class AddProductProcess extends AddProductEvent {
  AddProductProcess(this.tableName);
 final String tableName;
}

class AddProductImageOne extends AddProductEvent {
  AddProductImageOne(this.image);
 final String image;
}

class AddProductImageTwo extends AddProductEvent {
  AddProductImageTwo(this.image);
 final String image;
}
class AddProductImageThree extends AddProductEvent {
  AddProductImageThree(this.image);
 final String image;
}
class AddProductImageFour extends AddProductEvent {
  AddProductImageFour(this.image);
 final String image;
}
