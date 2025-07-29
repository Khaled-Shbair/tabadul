import '/config/all_imports.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(this._sharedPref) : super(BottomNavIndexChanged(0)) {
    on<MainEvent>((event, emit) {});
    on<BottomNavIndexChange>(_bottomNavIndexChange);
  }
  final SharedPreferencesController _sharedPref;
  void _bottomNavIndexChange(BottomNavIndexChange event, Emitter emit) {
    if (event.index == 1) {
      initNotifications();
    } else if (event.index == 2) {
      if (_sharedPref.getString(SharedPreferenceKeys.job).isEmpty) {
        initRegisterAsServiceProvide();
      }
    }
    emit(BottomNavIndexChanged(event.index));
  }
}
