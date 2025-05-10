import '/config/all_imports.dart';

class CustomMenuScreen extends StatelessWidget {
  const CustomMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: ListView(
        primary: false,
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h40,
          start: ManagerWidth.w28,
        ),
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: GestureDetector(
              onTap: () => ZoomDrawer.of(context)?.close(),
              child: CircleAvatar(
                radius: ManagerRadius.r16,
                backgroundColor: context.theme.colorScheme.secondary,
                child: SvgPicture.asset(
                  ManagerAssets.closeIcon,
                  height: ManagerHeight.h11,
                  width: ManagerWidth.w11,
                ),
              ),
            ),
          ),
          verticalSpace(ManagerHeight.h128),
          ...List.generate(
            items.length,
            (index) {
              return CustomItemButton(
                icon: items[index].icon,
                title: items[index].title,
                onTap: () {
                  ZoomDrawer.of(context)?.close();
                  items[index].onTap();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomItemButton extends StatelessWidget {
  const CustomItemButton({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  final String icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      splashColor: context.theme.unselectedWidgetColor,
      contentPadding: EdgeInsetsDirectional.zero,
      minLeadingWidth: 0,
      leading: SvgPicture.asset(
        icon,
        height: icon == ManagerAssets.registerAsServiceProviderIcon
            ? ManagerHeight.h22
            : ManagerHeight.h17,
        width: icon == ManagerAssets.registerAsServiceProviderIcon
            ? ManagerWidth.w22
            : ManagerWidth.w17,
      ),
      title: Text(
        title,
        style: context.textTheme.labelLarge?.copyWith(
          fontFamily: ManagerFontFamily.kHelveticaLNeeL,
        ),
      ),
    );
  }
}
