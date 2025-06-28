part of 'timer_bloc.dart';

sealed class TimerEvent {}

class StartTimer extends TimerEvent {
  final int duration;

  StartTimer(this.duration);
}

class TimerTicked extends TimerEvent {
  final int remainingSeconds;

  TimerTicked(this.remainingSeconds);
}

class FinishTimer extends TimerEvent {}
