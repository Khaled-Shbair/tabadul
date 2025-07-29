part of 'notifications_bloc.dart';

sealed class NotificationsEvent {}

class GetNotifications extends NotificationsEvent {
  final bool loadMore;

  GetNotifications({this.loadMore = false});
}
