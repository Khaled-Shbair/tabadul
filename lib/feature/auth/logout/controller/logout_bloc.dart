import '/config/all_imports.dart';

part 'logout_event.dart';

part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc(this._sharedPref, this._repo) : super(LogoutInitial()) {
    on<LogoutProcess>(_logoutProcess);
  }

  final SharedPreferencesController _sharedPref;

  final AuthRepo _repo;

  void _logoutProcess(LogoutProcess event, Emitter emit) async {
    emit(LogoutLoading());
    (await _repo.logout()).fold(
      (l) {
        emit(LogoutFailure(l.message));
      },
      (r) {
        emit(LogoutSuccessfully());
        _clearUserDataFormSharedPreferences();
      },
    );
  }

  void _clearUserDataFormSharedPreferences() {
    _sharedPref.removeData(SharedPreferenceKeys.loggedIn);
    _sharedPref.removeData(SharedPreferenceKeys.image);
    _sharedPref.removeData(SharedPreferenceKeys.firstName);
    _sharedPref.removeData(SharedPreferenceKeys.lastName);
    _sharedPref.removeData(SharedPreferenceKeys.city);
    _sharedPref.removeData(SharedPreferenceKeys.id);
    _sharedPref.removeData(SharedPreferenceKeys.regionAndStreet);
    _sharedPref.removeData(SharedPreferenceKeys.verificationId);
    _sharedPref.removeData(SharedPreferenceKeys.phoneNumber);
  }
}
