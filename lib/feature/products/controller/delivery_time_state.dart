part of 'delivery_time_bloc.dart';

sealed class DeliveryTimeState {
  final TimeOfDay selectedTime;
  const DeliveryTimeState(this.selectedTime);
}

class DeliveryTimeInitial extends DeliveryTimeState {
  DeliveryTimeInitial() : super(TimeOfDay(hour: 0, minute: 0));
}

class DeliveryTimeSelected extends DeliveryTimeState {
  const DeliveryTimeSelected(super.selectedTime);
}
