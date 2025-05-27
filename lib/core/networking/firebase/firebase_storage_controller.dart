import 'dart:io';
import '/config/all_imports.dart';

class FirebaseStorageController {
  final FirebaseStorage _storage;

  FirebaseStorageController(this._storage);

  Future<String?> uploadImageToFirebase(
      File uploadImage, String phoneNumber) async {
    try {
      debugPrint('📤 Starting upload for ...');
      final storageRef =
          _storage.ref().child('profile_images/$phoneNumber.jpg');
      final uploadTask = await storageRef
          .putFile(uploadImage)
          .whenComplete(() => debugPrint('✅ Upload completed'));
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      debugPrint('🌐 Download URL: ()');

      return downloadUrl;
    } catch (e, stack) {
      debugPrint("❌ Upload failed: $e");
      debugPrint("📌 Stack: $stack");
      return null;
    }
  }
}
