import '/config/all_imports.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  static String currentRoute = '';

  void _updateCurrentRoute(Route? route) {
    if (route is PageRoute) {
      currentRoute = route.settings.name ?? '';
      debugPrint('📍 currentRoute = $currentRoute');
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _updateCurrentRoute(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _updateCurrentRoute(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _updateCurrentRoute(previousRoute);
    super.didPop(route, previousRoute);
  }
}
