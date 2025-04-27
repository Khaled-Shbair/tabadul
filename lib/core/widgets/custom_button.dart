import '/config/all_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.child,
    this.color = ManagerColors.primaryColor,
    this.borderSideColor = ManagerColors.primaryColor,
    this.borderRadius,
    this.elevation,
    this.height,
    this.highlightColor,
    this.highlightElevation,
    this.minWidth,
    this.padding,
    this.shape,
    this.side,
    this.splashColor,
    super.key,
  });

  final Function()? onPressed;
  final Widget child;
  final Color color;
  final double? height;
  final double? minWidth;
  final double? elevation;
  final ShapeBorder? shape;
  final BorderSide? side;
  final double? borderRadius;
  final Color? highlightColor;
  final Color? splashColor;
  final Color borderSideColor;
  final double? highlightElevation;
  final EdgeInsetsDirectional? padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      height: height ?? ManagerHeight.h39,
      minWidth: minWidth ?? ManagerWidth.infinity,
      elevation: elevation.onNull(),
      highlightColor: highlightColor,
      highlightElevation: highlightElevation ?? 0,
      focusColor: ManagerColors.transparent,
      splashColor: splashColor,
      disabledColor: context.theme.colorScheme.secondary,
      padding: padding,
      shape: shape ??
          RoundedRectangleBorder(
            side: side ??
                BorderSide(
                  color: context.theme.unselectedWidgetColor,
                  width: AppConstants.widthOfSideOfBorderSideInMainButton,
                ),
            borderRadius:
                BorderRadius.circular(borderRadius ?? ManagerRadius.r5),
          ),
      child: child,
    );
  }
}
