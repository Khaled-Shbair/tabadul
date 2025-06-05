part of 'notifications_bloc.dart';

sealed class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}
class MoreNotificationsLoading extends NotificationsState {}

class NotificationsSuccessfully extends NotificationsState {
  final List<String> notifications;
  NotificationsSuccessfully(this.notifications);
}

class NotificationsFailure extends NotificationsState {
  final String message;
  final int code;
  NotificationsFailure(this.message, this.code);
}
