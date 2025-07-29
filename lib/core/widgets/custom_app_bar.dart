import '/config/all_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.functionLeadingButton,
    this.functionActionButton,
    this.titleStyle,
    this.iconLeading = Icons.arrow_back_ios_new,
    this.iconAction = Icons.menu,
    super.key,
  });

  final String title;
  final Function()? functionLeadingButton;
  final Function()? functionActionButton;
  final IconData iconLeading;
  final IconData iconAction;
  final TextStyle? titleStyle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style:titleStyle ,),
      leading: functionLeadingButton != null
          ? CustomAppBarButton(
              icon: iconLeading,
              onTap: functionLeadingButton!,
            )
          : null,
      leadingWidth: ManagerWidth.w60,
      actions: functionActionButton != null
          ? [
              CustomAppBarButton(
                icon: iconAction,
                isLeading: false,
                onTap: functionActionButton!,
              ),
            ]
          : null,
    );
  }
}

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton({
    required this.onTap,
    required this.icon,
    this.isLeading = true,
    super.key,
  });

  final Function() onTap;
  final IconData icon;
  final bool isLeading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ManagerHeight.h30,
        width: ManagerWidth.w30,
        margin: EdgeInsetsDirectional.only(
          start: isLeading ? ManagerWidth.w28 : 0,
          end: isLeading ? 0 : ManagerWidth.w28,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.secondary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ManagerColors.spaceCadet.withAlpha(50),
              offset: Offset(ManagerWidth.w0, ManagerHeight.h3),
              blurRadius: ManagerRadius.r6,
            ),
          ],
        ),
        child: Icon(icon),
      ),
    );
  }
}
