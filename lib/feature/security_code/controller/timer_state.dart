part of 'timer_bloc.dart';

sealed class TimerState {}

class TimerInitial extends TimerState {}

class TimerRunInProgress extends TimerState {
  final int seconds;

  TimerRunInProgress(this.seconds);
}

class TimerRunComplete extends TimerState {}
