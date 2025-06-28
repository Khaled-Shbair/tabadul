part of 'delivery_time_bloc.dart';

@immutable
sealed class DeliveryTimeEvent {}


class SelectTime extends DeliveryTimeEvent {
  final TimeOfDay time;
  SelectTime(this.time);
}