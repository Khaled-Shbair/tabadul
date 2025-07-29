import '/config/all_imports.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreen: Navigator(
        key: Routes.zoomDrawerNavigatorKey,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.homeScreen,
        observers: [AppRouteObserver()],
      ),
      menuScreen: CustomMenuScreen(),
      borderRadius: ManagerRadius.r30,
      menuScreenWidth: ManagerWidth.w237,
      disableDragGesture: true,
      boxShadow: [
        BoxShadow(
          spreadRadius: -42,
          blurStyle: BlurStyle.inner,
          color: Colors.white.withAlpha(100),
          offset: Offset(ManagerWidth.w56, ManagerHeight.h0),
        ),
      ],
      slideWidth: ManagerWidth.w240,
      angle: 0.0,
      isRtl: true,
      menuBackgroundColor: context.theme.primaryColor,
      androidCloseOnBackTap: true,
    );
  }
}
