part of 'main_bloc.dart';

sealed class MainState {}

class BottomNavIndexChanged extends MainState {
  int index = 0;

  BottomNavIndexChanged(this.index);
}
