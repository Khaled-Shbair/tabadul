import '/config/all_imports.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<StartTimer>(_startTimer);
    on<FinishTimer>(_finishTimer);
    on<TimerTicked>(_timerTicked);
  }

  Timer? _timer;

  void _startTimer(StartTimer event, Emitter emit) {
    _timer?.cancel();
    emit(TimerRunInProgress(event.duration));
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (t) {
        final newSeconds = event.duration - t.tick;
        if (newSeconds == 0) {
          add(FinishTimer());
        } else {
          add(TimerTicked(newSeconds));
        }
      },
    );
  }

  void _timerTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.remainingSeconds));
  }

  void _finishTimer(FinishTimer event, Emitter emit) {
    _timer?.cancel();
    emit(TimerRunComplete());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
