import '/config/all_imports.dart';
import 'dart:ui';

void customImageSelectionBox(
  BuildContext context, {
  required Function() onTapGallery,
  required Function() onTapCamera,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.white.withAlpha(80),
    barrierLabel: '',
    pageBuilder: (_, __, ___) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: BottomSheet(
          backgroundColor: context.theme.colorScheme.secondary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ManagerRadius.r20),
              topRight: Radius.circular(ManagerRadius.r20),
            ),
          ),
          onClosing: () {},
          builder: (context) {
            return SizedBox(
              height: ManagerHeight.h163,
              width: double.infinity,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsetsDirectional.only(
                  top: ManagerHeight.h20,
                  start: ManagerWidth.w38,
                ),
                children: [
                  Text(
                    ManagerStrings.personalImage,
                    style: context.textTheme.headlineLarge,
                  ),
                  verticalSpace(ManagerHeight.h7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _button(context, ManagerStrings.gallery, Icons.image,
                          onTapGallery),
                      horizontalSpace(ManagerWidth.w30),
                      _button(context, ManagerStrings.camera, Icons.camera_alt,
                          onTapCamera),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 300),
  );
}

Widget _button(
  BuildContext context,
  String title,
  IconData icon,
  Function() onTap,
) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        hoverColor: context.theme.unselectedWidgetColor,
        focusColor: context.theme.unselectedWidgetColor,
        highlightColor: context.theme.unselectedWidgetColor,
        splashColor: context.theme.unselectedWidgetColor,
        child: Container(
          height: ManagerHeight.h40,
          width: ManagerWidth.w40,
          margin: EdgeInsetsDirectional.only(
            bottom: ManagerHeight.h6,
            top: ManagerHeight.h10,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.colorScheme.secondary,
            boxShadow: [
              BoxShadow(
                offset: Offset(ManagerWidth.w0, ManagerHeight.h3),
                blurRadius: 6,
                color: context.theme.colorScheme.shadow,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      Text(title, style: context.textTheme.bodyMedium),
    ],
  );
}
