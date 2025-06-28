import '/config/all_imports.dart';

part 'register_as_service_provide_event.dart';
part 'register_as_service_provide_state.dart';

class RegisterAsServiceProvideBloc
    extends Bloc<RegisterAsServiceProvideEvent, RegisterAsServiceProvideState> {
  RegisterAsServiceProvideBloc(this.sharedPref, this._repo)
      : super(RegisterAsServiceProvideInitial(sharedPref
                .getString(SharedPreferenceKeys.imageOfProvideService)
                .isNotEmpty
            ? sharedPref.getString(SharedPreferenceKeys.imageOfProvideService)
            : sharedPref.getString(SharedPreferenceKeys.image))) {
    on<PickProfileImageFromCamera>(_pickProfileImageFromCamera);
    on<PickProfileImageFromGallery>(_pickProfileImageFromGallery);
    on<RegisterProcess>(_registerProcess);
  }

  final SharedPreferencesController sharedPref;
  final ServicesProvidesRepo _repo;
  final TextEditingController descriptionOfJob = TextEditingController();
  final TextEditingController job = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void _pickProfileImageFromCamera(
      PickProfileImageFromCamera event, Emitter emit) async {
    if (event.imagePath.isNotEmpty) {
      emit(RegisterAsServiceProvideInitial(event.imagePath));
    } else {
      emit(RegisterAsServiceProvideFailure(
          ManagerStrings.failedPickImage, state.image));
    }
  }

  void _pickProfileImageFromGallery(
      PickProfileImageFromGallery event, Emitter emit) async {
    if (event.imagePath.isNotEmpty) {
      emit(RegisterAsServiceProvideInitial(event.imagePath));
    } else {
      emit(RegisterAsServiceProvideFailure(
          ManagerStrings.failedPickImage, state.image));
    }
  }

  Future<void> _registerProcess(RegisterProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      emit(RegisterAsServiceProvideLoading(state.image));
      (await _repo.registerAsServiceProvide(UserModel(
        description: descriptionOfJob.text,
        phoneNumber: sharedPref.getString(SharedPreferenceKeys.phoneNumber),
        job: job.text,
        updateImage:
            state.image != sharedPref.getString(SharedPreferenceKeys.image)
                ? File(state.image)
                : null,
      )))
          .fold(
        (l) {
          emit(RegisterAsServiceProvideFailure(l.message, state.image));
        },
        (r) {
          sharedPref.setData(
              SharedPreferenceKeys.description, descriptionOfJob.text);
          sharedPref.setData(SharedPreferenceKeys.job, job.text);
          if (r.image != null) {
            sharedPref.setData(
                SharedPreferenceKeys.imageOfProvideService, r.image);
          } else {
            sharedPref.setData(SharedPreferenceKeys.imageOfProvideService,
                sharedPref.getString(SharedPreferenceKeys.image));
          }

          emit(RegisterAsServiceProvideSuccessfully(state.image));
        },
      );
    }
  }
}
