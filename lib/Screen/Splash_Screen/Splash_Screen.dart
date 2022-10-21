import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../constants/strings.dart';
import '../../shared_preference/pref_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    String route = SharedPreferencesController().onBoarding
        ? loginScreen
        : onBoarding1Screen;
    Future.delayed(
      const Duration(seconds: 6),
      () => Navigator.pushReplacementNamed(context, route),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Scaffold(
      backgroundColor: const Color(0XFF464698),
      body: Stack(
        children: const [
          Circles(opacity: .45, value: 50, milliseconds: 500),
          Circles(opacity: .39, value: 100, milliseconds: 800),
          Circles(opacity: .33, value: 150, milliseconds: 1100),
          Circles(opacity: .27, value: 200, milliseconds: 1400),
          Circles(opacity: .21, value: 250, milliseconds: 1700),
          Circles(opacity: .15, value: 300, milliseconds: 2000),
          Circles(opacity: .12, value: 350, milliseconds: 2300),
          Circles(opacity: .10, value: 400, milliseconds: 2600),
          LogoWidget(),
        ],
      ),
    );
  }
}

class Circles extends StatelessWidget {
  const Circles({
    Key? key,
    required this.opacity,
    required this.value,
    required this.milliseconds,
  }) : super(key: key);
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
          lineWidth: 20,
          animation: true,
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      from: 200,
      delay: const Duration(seconds: 3),
      child: Center(
        child: SvgPicture.asset(
          'images/logo.svg',
          alignment: AlignmentDirectional.bottomCenter,
        ),
      ),
    );
  }
}
