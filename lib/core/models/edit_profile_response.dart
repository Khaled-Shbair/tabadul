class EditProfileResponse {
  final bool status;
  String? image;
  final String? error;

  EditProfileResponse({
    required this.status,
    this.image,
    this.error,
  });
}
