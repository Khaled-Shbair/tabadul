import '/config/all_imports.dart';

class MenuItemModel {
  final String icon;
  final String title;
  final String route;

  const MenuItemModel(this.icon, this.title, this.route);
}

final List<MenuItemModel> items = <MenuItemModel>[
  MenuItemModel(
      ManagerAssets.userIcon, ManagerStrings.profile, Routes.profileScreen),
  MenuItemModel(ManagerAssets.registerAsServiceProviderIcon,
      ManagerStrings.listProvideService, Routes.listProvideServiceScreen),
  MenuItemModel(ManagerAssets.profileProvideServiceIcon,
      ManagerStrings.profileProvideService, Routes.profileProvideServiceScreen),
  MenuItemModel(ManagerAssets.whatsAppIcon, ManagerStrings.contactUsOnWhatsapp,
      ManagerStrings.contactUsOnWhatsapp),
  MenuItemModel(ManagerAssets.infoIcon, ManagerStrings.aboutApplication,
      Routes.infoScreen),
  MenuItemModel(
      ManagerAssets.logoutIcon, ManagerStrings.logout, Routes.logoutScreen),
];
