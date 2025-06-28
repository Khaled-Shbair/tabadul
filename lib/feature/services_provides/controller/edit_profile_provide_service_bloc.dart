import '/config/all_imports.dart';

part 'edit_profile_provide_service_event.dart';
part 'edit_profile_provide_service_state.dart';

class EditProfileProvideServiceBloc extends Bloc<EditProfileProvideServiceEvent,
    EditProfileProvideServiceState> {
  EditProfileProvideServiceBloc(this._repo, this.sharedPref)
      : super(EditProfileProvideServiceInitial(
            image: sharedPref
                .getString(SharedPreferenceKeys.imageOfProvideService))) {
    on<PickImageFromCamera>(_pickImageFromCamera);
    on<PickImageFromGallery>(_pickImageFromGallery);
    on<SaveEditedData>(_saveEditedData);
    job = TextEditingController(
        text: sharedPref.getString(SharedPreferenceKeys.job));
    description = TextEditingController(
        text: sharedPref.getString(SharedPreferenceKeys.description));
  }
  final SharedPreferencesController sharedPref;
  final ServicesProvidesRepo _repo;
  late TextEditingController job;
  late TextEditingController description;

  void _pickImageFromCamera(PickImageFromCamera event, Emitter emit) async {
    if (event.imagePath.isNotEmpty) {
      emit(EditProfileProvideServiceInitial(image: event.imagePath));
    } else {
      emit(EditProfileProvideServiceFailure(ManagerStrings.failedPickImage,
          image: state.image));
    }
  }

  void _pickImageFromGallery(PickImageFromGallery event, Emitter emit) async {
    if (event.imagePath.isNotEmpty) {
      emit(EditProfileProvideServiceInitial(image: event.imagePath));
    } else {
      emit(EditProfileProvideServiceFailure(ManagerStrings.failedPickImage,
          image: state.image));
    }
  }

  Future<void> _saveEditedData(SaveEditedData event, Emitter emit) async {
    if (true) {
      emit(EditProfileProvideServiceLoading(image: state.image));
      String imagePath = state.image;
      (await _repo.editProfileProvideService(UserModel(
        phoneNumber: sharedPref.getString(SharedPreferenceKeys.phoneNumber),
        job: job.text.isNotEmpty ? job.text : null,
        description: description.text.isNotEmpty ? description.text : null,
        updateImage: imagePath ==
                sharedPref.getString(SharedPreferenceKeys.imageOfProvideService)
            ? null
            : File(imagePath),
      )))
          .fold(
        (l) => emit(
            EditProfileProvideServiceFailure(l.message, image: state.image)),
        (r) {
          sharedPref.setData(
              SharedPreferenceKeys.description, description.text);
          sharedPref.setData(SharedPreferenceKeys.job, job.text);
          if (r.image != null) {
            sharedPref.setData(
                SharedPreferenceKeys.imageOfProvideService, r.image);
          }
          emit(EditProfileProvideServiceSuccessfully(image: state.image));
        },
      );
    }
  }
}
