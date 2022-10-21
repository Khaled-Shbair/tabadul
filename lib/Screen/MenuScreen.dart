import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/fonts.dart';
import '../AllPages.dart';
import '../Widget/Button_AppBar.dart';
import '../constants/colors.dart';
import 'Info_Screen.dart';
import 'Provide_Service_Screen/List_Provide_Service_Screen.dart';
import 'Login and Create Account Screen/Logout_Screen.dart';
import 'Provide_Service_Screen/Successfully_Registered_As_Service_Provider_Screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuItem currentItem = MenuItems.mainScreen;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
                ZoomDrawer.of(context)!.close();
              });
            },
          );
        },
      ),
      mainScreen: currentScreen(),
      borderRadius: 40,
      menuScreenWidth: 237,
      boxShadow: [
        BoxShadow(
          spreadRadius: -48,
          blurStyle: BlurStyle.inner,
          color: Colors.white.withOpacity(.50),
          offset: const Offset(75, 0),
        ),
      ],
      slideWidth: 281.5,
      angle: 0.0,
      isRtl: true,
      menuBackgroundColor: ColorsApp.s,
      androidCloseOnBackTap: true,
    );
  }

  Widget currentScreen() {
    switch (currentItem) {
      case MenuItems.profilePerson:
        return const ProfileScreen();
      case MenuItems.listProvideService:
        return const ListProvideServiceScreen();
      case MenuItems.profileProvideService:
        return const ProfileScreen();
      case MenuItems.whatApp:
        return const ProfileScreen();
      case MenuItems.info:
        return const InfoScreen();
      case MenuItems.logout:
        return const LogoutScreen();
      default:
        return const AllPages();
    }
  }
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.s,
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsetsDirectional.only(top: 20, start: 20, end: 0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonAppBar(
                  function: () {
                    ZoomDrawer.of(context)!.close();
                  },
                  icon: Icons.close,
                ),
              ],
            ),
            const SizedBox(height: 140),
            ...MenuItems.all.map(buildMenuItems).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(MenuItem item) {
    return ListTile(
      selected: currentItem == item,
      contentPadding: EdgeInsetsDirectional.zero,
      minLeadingWidth: 0,
      leading: Icon(item.icon, color: Colors.white),
      title: Text(
        item.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontFamily: FontsApp.helveticaL,
        ),
      ),
      onTap: () => onSelectedItem(item),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String title;

  const MenuItem(this.icon, this.title);
}

class MenuItems {
  static const mainScreen = MenuItem(Icons.person, 'الرئيسية');
  static const profilePerson = MenuItem(Icons.person, 'الملف الشخصي');
  static const listProvideService =
      MenuItem(Icons.volunteer_activism_sharp, 'قائمة مزودي الخدمات');
  static const profileProvideService =
      MenuItem(Icons.personal_injury, 'الملف الشخصي(مزود الخدمات)');
  static const whatApp = MenuItem(Icons.facebook, 'راسلنا على الواتس');
  static const info = MenuItem(Icons.help, 'عن التطبيق');
  static const logout = MenuItem(Icons.logout, 'تسجيل خروج');
  static const all = <MenuItem>[
    profilePerson,
    listProvideService,
    profileProvideService,
    whatApp,
    info,
    logout,
  ];
}
