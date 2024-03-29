import '../firebase/firebase_firestore_controller.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../constants/routes.dart';
import 'package:get/get.dart';

class AddProductGetxController extends GetxController {
  static AddProductGetxController get to => Get.find();
  final FbFirestoreController _firestore = FbFirestoreController();
  late TextEditingController _productController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  bool _clickOne = true;
  bool _clickTwo = false;
  bool _clickThree = true;
  bool _clickFour = true;

  TextEditingController get productController => _productController;

  TextEditingController get priceController => _priceController;

  TextEditingController get descriptionController => _descriptionController;

  bool get clickOne => _clickOne;

  bool get clickTwo => _clickTwo;

  bool get clickThree => _clickThree;

  bool get clickFour => _clickFour;

  @override
  void onInit() {
    _productController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _productController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.onClose();
  }

  void boxOne() {
    if (_clickFour == true && _clickTwo == true && _clickThree == true) {
      _clickOne = false;
      _clickTwo = true;
      _clickThree = true;
      _clickFour = true;
      update();
    }
  }

  void boxTwo() {
    if (_clickOne == true && _clickFour == true && _clickThree == true) {
      _clickOne = true;
      _clickTwo = false;
      _clickThree = true;
      _clickFour = true;
      update();
    }
  }

  void boxThree() {
    if (_clickOne == true && _clickFour == true && _clickTwo == true) {
      _clickOne = true;
      _clickTwo = true;
      _clickThree = false;
      _clickFour = true;
      update();
    }
  }

  void boxFour() {
    if (_clickOne == true && _clickThree == true && _clickTwo == true) {
      _clickOne = true;
      _clickTwo = true;
      _clickThree = true;
      _clickFour = false;
      update();
    }
  }

  void addProduct(String nameDepartment) async {
    if (_productController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      ProductModel product = ProductModel(
        imageOne: '',
        imageTwo: '',
        imageThree: '',
        imageFour: '',
        name: _productController.text,
        price: _priceController.text,
        description: _descriptionController.text,
      );
      if (nameDepartment == 'furniture_department'.tr) {
        await _firestore
            .addToFurnitureDepartment(product)
            .then((value) => _navigation());
      } else if (nameDepartment == 'phone_department'.tr) {
        await _firestore
            .addToPhoneDepartment(product)
            .then((value) => _navigation());
      } else if (nameDepartment == 'computer_department'.tr) {
        await _firestore
            .addToComputerDepartment(product)
            .then((value) => _navigation());
      } else if (nameDepartment == 'motorcycle_department'.tr) {
        await _firestore
            .addToMotorcycleDepartment(product)
            .then((value) => _navigation());
      } else if (nameDepartment == 'bicycle_department'.tr) {
        await _firestore
            .addToBicycleDepartment(product)
            .then((value) => _navigation());
      } else if (nameDepartment == 'car_department'.tr) {
        await _firestore
            .addToCarDepartment(product)
            .then((value) => _navigation());
      } else if (nameDepartment == 'electric_machines_department'.tr) {
        await _firestore
            .addToElectricMachinesDepartment(product)
            .then((value) => _navigation());
      } else if (nameDepartment == 'carpets_and_mattresses_department'.tr) {
        await _firestore
            .addToCarpetsAndMattressesDepartment(product)
            .then((value) => _navigation());
      }
    } else {
      Get.snackbar('يرجى ادخال البيانات المطلوبة', '');
    }
  }

  void _navigation() {
    //Get.toNamed(addedSuccessfullyScreen);
  }
}
