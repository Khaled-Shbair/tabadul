part of 'main_bloc.dart';

sealed class MainEvent {}

class BottomNavIndexChange extends MainEvent {
  final int index;

  BottomNavIndexChange(this.index);
}
