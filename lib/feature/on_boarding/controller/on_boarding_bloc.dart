import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/all_imports.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final SharedPreferencesController _sharedPref;
  final PageController pageController = PageController();

  OnBoardingBloc(this._sharedPref) : super(OnBoardingInitial()) {
    on<PageChangedEvent>(_pageChanged);
    on<ButtonPressedEvent>(_buttonPressed);
  }

  bool isFirstPage() => state.currentPage == 0;

  void _pageChanged(PageChangedEvent event, Emitter emit) {
    emit(OnBoardingInitial(currentPage: event.page));
  }

  void _buttonPressed(ButtonPressedEvent event, Emitter emit) {
    if (isFirstPage()) {
      pageController.nextPage(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      event.context.pushNamedAndRemoveAllUntil(Routes.loginScreen);
      _sharedPref.setData(SharedPreferenceKeys.viewOnBoarding, true);
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    disposeOnBoarding();
    return super.close();
  }
}
