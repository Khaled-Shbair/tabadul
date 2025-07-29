import '/config/all_imports.dart';

class CustomCircleAnimation extends StatelessWidget {
  const CustomCircleAnimation({
    required this.opacity,
    required this.value,
    required this.milliseconds,
    required this.width,
    super.key,
  });

  final double opacity;
  final double value;
  final double width;
  final int milliseconds;

  @override
  Widget build(BuildContext context) {
    return FadeOut(
      animate: true,
      delay: Duration(milliseconds: milliseconds),
      child: OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: CircularPercentIndicator(
          curve: Curves.bounceOut,
          radius: value,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.white.withOpacity(opacity),
          animation: true,
          lineWidth: width,
          backgroundWidth: width,
        ),
      ),
    );
  }
}
