import 'dart:io';

import '/config/all_imports.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._repo, this._sharedPref)
      : super(EditProfileInitial(
            image: _sharedPref.getString(SharedPreferenceKeys.image))) {
    on<EditButton>(_saveDataProcess);
    on<SelectCity>((event, emit) => selectedCity = event.city);
    on<SelectRegion>((event, emit) => selectedRegion = event.regionAndStreet);

    on<GetCities>(_getCities);
    on<GetRegions>(_getRegions);
    on<PickProfileImageFromCamera>(_pickProfileImageFromCamera);
    on<PickProfileImageFromGallery>(_pickProfileImageFromGallery);
    add(GetCities());
    add(GetRegions());
    _monitorConnection();
    firstName = TextEditingController(
        text: _sharedPref.getString(SharedPreferenceKeys.firstName));
    lastName = TextEditingController(
        text: _sharedPref.getString(SharedPreferenceKeys.lastName));
    selectedCity = _sharedPref.getString(SharedPreferenceKeys.city);
    selectedRegion =
        _sharedPref.getString(SharedPreferenceKeys.regionAndStreet);
  }

  final ProfileRepo _repo;

  final SharedPreferencesController _sharedPref;
  late TextEditingController firstName;

  late TextEditingController lastName;

  final formKey = GlobalKey<FormState>();
  String selectedCity = '';

  String selectedRegion = '';
  StreamSubscription<InternetStatus>? _internetSubscription;
  bool _citiesLoadingFailure = false;
  bool _regionsLoadingFailure = false;

  void _monitorConnection() {
    _internetSubscription =
        InternetConnection().onStatusChange.listen((status) {
      debugPrint('monitor connection:${status == InternetStatus.connected}');
      if (status == InternetStatus.connected) {
        if (_citiesLoadingFailure) {
          add(GetCities());
          _citiesLoadingFailure = false;
        }
        if (_regionsLoadingFailure) {
          add(GetRegions());
          _regionsLoadingFailure = false;
        }
      }
    });
  }

  void _getCities(GetCities event, Emitter emit) async {
    (await _repo.getCities()).fold(
      (l) {
        if (l.code == -1) {
          emit(EditProfileFailure(l.message, image: state.image));
          _citiesLoadingFailure = true;
        }
      },
      (r) {
        if (state is EditProfileInitial) {
          emit((state as EditProfileInitial).copyWith(
              cities: r.cities.map<String>((e) => e.nameAr ?? '').toList()));
        }
      },
    );
  }

  void _getRegions(GetRegions event, Emitter emit) async {
    (await _repo.getRegions()).fold(
      (l) {
        if (l.code == -1) {
          emit(EditProfileFailure(l.message, image: state.image));

          _regionsLoadingFailure = true;
        }
      },
      (r) {
        if (state is EditProfileInitial) {
          emit((state as EditProfileInitial).copyWith(
              regions: r.regions.map<String>((e) => e.nameAr ?? '').toList()));
        }
      },
    );
  }

  void _pickProfileImageFromCamera(
      PickProfileImageFromCamera event, Emitter emit) async {
    if (event.imagePath.isNotEmpty) {
      if (state is EditProfileInitial) {
        emit((state as EditProfileInitial).copyWith(image: event.imagePath));
      }
    } else {
      emit(EditProfileFailure(ManagerStrings.failedPickImage,
          image: state.image));
    }
  }

  void _pickProfileImageFromGallery(
      PickProfileImageFromGallery event, Emitter emit) async {
    if (event.imagePath.isNotEmpty) {
      if (state is EditProfileInitial) {
        emit((state as EditProfileInitial).copyWith(image: event.imagePath));
      }
    } else {
      emit(EditProfileFailure(ManagerStrings.failedPickImage,
          image: state.image));
    }
  }

  bool sameData() {
    if (firstName.text !=
            _sharedPref.getString(SharedPreferenceKeys.firstName) ||
        lastName.text != _sharedPref.getString(SharedPreferenceKeys.lastName) ||
        selectedCity == _sharedPref.getString(SharedPreferenceKeys.city) ||
        selectedRegion !=
            _sharedPref.getString(SharedPreferenceKeys.regionAndStreet)) {
      return true;
    }
    return false;
  }

  void _saveDataProcess(EditButton event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      String? imagePath = state.image;
      emit(EditProfileLoading(image: state.image));
      var request = EditProfileRequest(
        firstName: firstName.text.trim() ==
                _sharedPref.getString(SharedPreferenceKeys.firstName)
            ? null
            : firstName.text.trim(),
        lastName: lastName.text.trim() ==
                _sharedPref.getString(SharedPreferenceKeys.lastName)
            ? null
            : lastName.text.trim(),
        region: selectedRegion ==
                _sharedPref.getString(SharedPreferenceKeys.regionAndStreet)
            ? null
            : selectedRegion,
        city: selectedCity == _sharedPref.getString(SharedPreferenceKeys.city)
            ? null
            : selectedCity,
        uploadImage:
            imagePath == _sharedPref.getString(SharedPreferenceKeys.image)
                ? null
                : File(imagePath),
        phoneNumber: _sharedPref.getString(SharedPreferenceKeys.phoneNumber),
      );
      if (request.firstName == null &&
          request.lastName == null &&
          request.region == null &&
          request.city == null &&
          request.uploadImage == null) {
        emit(EditProfileFailure(ManagerStrings.noDataHasBeenModified,
            image: state.image));
        return;
      }
      (await _repo.editProfile(request)).fold(
        (l) {
          emit(EditProfileFailure(l.message, image: state.image));
        },
        (r) {
          _sharedPref.setData(SharedPreferenceKeys.image, r.image);
          _sharedPref.setData(SharedPreferenceKeys.city, selectedCity);
          _sharedPref.setData(
              SharedPreferenceKeys.firstName, firstName.text.trim());
          _sharedPref.setData(
              SharedPreferenceKeys.lastName, lastName.text.trim());
          _sharedPref.setData(
              SharedPreferenceKeys.regionAndStreet, selectedRegion);
          emit(EditProfileSuccessfully(image: state.image));
        },
      );
    }
  }

  @override
  Future close() async {
    firstName.clear();
    lastName.clear();
    selectedCity = '';
    selectedRegion = '';
    firstName.dispose();
    lastName.dispose();
    _internetSubscription?.cancel();
    await _internetSubscription?.cancel();
    return super.close();
  }
}
