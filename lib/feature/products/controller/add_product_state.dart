part of 'add_product_bloc.dart';

sealed class AddProductState {
  File? imageOne;
  File? imageTwo;
  File? imageThree;
  File? imageFour;

  AddProductState({
    this.imageOne,
    this.imageTwo,
    this.imageThree,
    this.imageFour,
  });
}

class AddProductInitial extends AddProductState {
  AddProductInitial({
    super.imageOne,
    super.imageTwo,
    super.imageThree,
    super.imageFour,
  });

  AddProductInitial copyWith({
    File? imageOne,
    File? imageTwo,
    File? imageThree,
    File? imageFour,
  }) {
    return AddProductInitial(
      imageOne: imageOne ?? this.imageOne,
      imageTwo: imageTwo ?? this.imageTwo,
      imageThree: imageThree ?? this.imageThree,
      imageFour: imageFour ?? this.imageFour,
    );
  }
}

class AddedImageProductFailure extends AddProductState {
  final String messageError;
  AddedImageProductFailure(
    this.messageError, {
    super.imageOne,
    super.imageTwo,
    super.imageThree,
    super.imageFour,
  });
}

class AddProductLoading extends AddProductState {
  AddProductLoading({
    super.imageOne,
    super.imageTwo,
    super.imageThree,
    super.imageFour,
  });
}

class AddProductSuccessfully extends AddProductState {}

class AddProductFailure extends AddProductState {
  final String messageError;
  AddProductFailure(
    this.messageError, {
    super.imageOne,
    super.imageTwo,
    super.imageThree,
    super.imageFour,
  });
}
