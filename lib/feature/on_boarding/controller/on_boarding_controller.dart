import '/config/all_imports.dart';

class OnBoardingController extends GetxController {
  final _sharedPref = instance<SharedPreferencesController>();

  int _currentPage = 0;

  late PageController _pageController;

  int get currentPage => _currentPage;

  PageController get pageController => _pageController;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool isFirstPage() => _currentPage == 0;

  void selectCurrentPage(int page) {
    _currentPage = page;
    update();
  }

  void buttonOnBoarding(BuildContext context) {
    if (isFirstPage()) {
      _pageController.nextPage(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      context.pushNamedAndRemoveAllUntil(Routes.loginScreen);
      _sharedPref.setData(SharedPreferenceKeys.viewOnBoarding, true);
      disposeOnBoarding();
    }
    update();
  }
}
