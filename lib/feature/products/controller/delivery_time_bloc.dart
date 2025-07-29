import '/config/all_imports.dart';

part 'delivery_time_event.dart';
part 'delivery_time_state.dart';

class DeliveryTimeBloc extends Bloc<DeliveryTimeEvent, DeliveryTimeState> {
  DeliveryTimeBloc() : super(DeliveryTimeInitial()) {
    on<SelectTime>(selectTime);
  }
  Future<void> selectTime(SelectTime event, Emitter emit) async {
    emit(DeliveryTimeSelected(event.time));
  }
}
