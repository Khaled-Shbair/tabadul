import '/config/all_imports.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(BottomNavIndexChanged(0)) {
    on<MainEvent>((event, emit) {});
    on<BottomNavIndexChange>(_bottomNavIndexChange);
  }

  void _bottomNavIndexChange(BottomNavIndexChange event, Emitter emit) {
    emit(BottomNavIndexChanged(event.index));
  }
}
