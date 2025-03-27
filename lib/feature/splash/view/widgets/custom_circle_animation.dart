import '/config/all_imports.dart';

class CustomCircleAnimation extends StatelessWidget {
  const CustomCircleAnimation({
    required this.opacity,
    required this.value,
    required this.milliseconds,
    super.key,
  });

  final double opacity;
  final double value;
  final int milliseconds;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeOut(
        animate: true,
        delay: Duration(milliseconds: milliseconds),
        child: CircularPercentIndicator(
          curve: Curves.bounceOut,
          radius: value,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.white.withOpacity(opacity),
          lineWidth: ManagerWidth.w40,
          animation: true,
        ),
      ),
    );
  }
}
