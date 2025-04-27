import '/config/all_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    required this.functionLeadingButton,
    this.iconLeading = Icons.menu,
    super.key,
  });

  final String title;
  final Function() functionLeadingButton;
  final IconData iconLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: CustomAppBarButton(
        icon: iconLeading,
        onTap: functionLeadingButton,
      ),

      // actions: [
      //   CustomAppBarButton(
      //     icon: iconLeading,
      //     onPressed: () => ZoomDrawer.of(context)!.toggle(),
      //   ),
      // ],
    );
  }
}

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(start: ManagerWidth.w20),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.secondary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ManagerColors.spaceCadet.withAlpha(20),
              offset: Offset(ManagerWidth.w0, ManagerHeight.h3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Icon(icon),
      ),
    );
  }
}
