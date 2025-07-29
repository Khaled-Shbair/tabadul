import '/config/all_imports.dart';

class BuyProductRequest {
  final String tableName;
  final String productId;
  BuyProductRequest({
    required this.tableName,
    required this.productId,
  });
  toMap() {
    return {
      FirebaseConstants.isSold: true,
      FirebaseConstants.buyerId: instance<SharedPreferencesController>()
          .getString(SharedPreferenceKeys.id),
      FirebaseConstants.soldAt: FieldValue.serverTimestamp(),
    };
  }
}
