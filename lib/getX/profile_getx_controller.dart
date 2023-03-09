import 'package:tabadul/models/user_model.dart';
import ''
    '../shared_preference/pref_controller.dart';

import '../firebase/firebase_firestore_controller.dart';
import 'package:get/get.dart';

class ProfileGetxController extends GetxController {
  static ProfileGetxController get to => Get.find();
  final FbFirestoreController _firestore = FbFirestoreController();
  final _userModel = Rxn<UserModel>();

  UserModel? get userModel => _userModel.value;

  set userModel(UserModel? user) => _userModel.value = user;

  final RxBool loading = false.obs;

  Future<void> getUserData(String phone) async {
    loading(true);
    _firestore.getUserData(
      phone,
      then: (value) {
        _userModel(UserModel.fromMap(value.data()!));
        PrefController().id = _userModel.value!.id;
        PrefController().firstName = _userModel.value!.firstName;
        PrefController().lastName = _userModel.value!.lastName;
        PrefController().image = _userModel.value!.image;
        PrefController().phone = _userModel.value!.phone;
        PrefController().city = _userModel.value!.city;
        PrefController().street = _userModel.value!.street;
        loading(false);
      },
      catchError: (e) {
        loading(true);
      },
    );
  }
}
