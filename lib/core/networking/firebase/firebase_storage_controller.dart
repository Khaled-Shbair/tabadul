import '/config/all_imports.dart';

class FirebaseStorageController {
  final FirebaseStorage _storage;

  FirebaseStorageController(this._storage);

  Future<String?> uploadImageToFirebase(
      File uploadImage, String folderName, String nameImage) async {
    try {
      debugPrint('📤 Starting upload for ...');
      final storageRef = _storage.ref().child('$folderName/$nameImage.jpg');
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

  Future<List<String>> uploadMultipleImagesToFirebase(
      List<File> images, String folderName) async {
    List<String> downloadUrls = [];
    for (var i in images) {
      final url = await uploadImageToFirebase(
        i,
        folderName,
        DateTime.now().millisecondsSinceEpoch.toString(),
      );
      if (url != null) {
        downloadUrls.add(url);
      }
    }

    return downloadUrls;
  }
}
