import '/config/all_imports.dart';

class MenuItemModel {
  final String icon;
  final String title;
  final Function() onTap;

  const MenuItemModel(
    this.icon,
    this.title,
    this.onTap,
  );
}

final List<MenuItemModel> items = <MenuItemModel>[
  MenuItemModel(
    ManagerAssets.userIcon,
    ManagerStrings.profile,
    () => Routes.zoomDrawerNavigatorKey.currentState
        ?.pushNamed(Routes.profileScreen),
  ),
  MenuItemModel(
    ManagerAssets.registerAsServiceProviderIcon,
    ManagerStrings.listProvideService,
    () => Routes.zoomDrawerNavigatorKey.currentState
        ?.pushNamed(Routes.listProvideServiceScreen),
  ),
  MenuItemModel(
    ManagerAssets.profileProvideServiceIcon,
    ManagerStrings.profileProvideService,
    () => Routes.zoomDrawerNavigatorKey.currentState
        ?.pushNamed(Routes.profileProvideServiceScreen),
  ),
  MenuItemModel(
    ManagerAssets.whatsAppIcon,
    ManagerStrings.contactUsOnWhatsapp,
    () {},
  ),
  MenuItemModel(
    ManagerAssets.infoIcon,
    ManagerStrings.aboutApplication,
    () => Routes.zoomDrawerNavigatorKey.currentState
        ?.pushNamed(Routes.infoScreen),
  ),
  MenuItemModel(
    ManagerAssets.logoutIcon,
    ManagerStrings.logout,
    () => Routes.zoomDrawerNavigatorKey.currentState
        ?.pushNamed(Routes.logoutScreen),
  ),
];


// enum MenuItemType {
//   main,
//   profile,
//   listProvideService,
//   profileProvideService,
//   contactUsOnWhatsapp,
//   aboutApplication,
//   logout,
// }
