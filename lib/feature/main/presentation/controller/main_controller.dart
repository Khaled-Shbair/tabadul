import '/config/all_imports.dart';

class MainController extends GetxController {
  int _currentIndex = 0;
  final List _iconBottomNavigationBar = [
    Icons.house,
    Icons.notifications_active,
    Icons.volunteer_activism_sharp,
    Icons.person,
  ];

  final List _screens = [
    MainScreen(),
    // NotificationsScreen(),
    // ProfileScreen(),
    // ProfileScreen(),
  ];

  List get iconBottomNavigationBar => _iconBottomNavigationBar;

  List get screen => _screens;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    update();
  }
}
