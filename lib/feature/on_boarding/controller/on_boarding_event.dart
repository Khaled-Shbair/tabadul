part of 'on_boarding_bloc.dart';

sealed class OnBoardingEvent {}

class PageChangedEvent extends OnBoardingEvent {
  final int page;

  PageChangedEvent(this.page);
}

class ButtonPressedEvent extends OnBoardingEvent {
  final BuildContext context;

  ButtonPressedEvent(this.context);
}
