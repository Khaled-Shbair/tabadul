part of 'on_boarding_bloc.dart';

sealed class OnBoardingState {
  int get currentPage;

  const OnBoardingState();
}

class OnBoardingInitial extends OnBoardingState {
  final int _currentPage;

  const OnBoardingInitial({int currentPage = 0}) : _currentPage = currentPage;

  @override
  int get currentPage => _currentPage;

  OnBoardingInitial copyWith({int? currentPage}) {
    return OnBoardingInitial(
      currentPage: currentPage ?? _currentPage,
    );
  }
}
