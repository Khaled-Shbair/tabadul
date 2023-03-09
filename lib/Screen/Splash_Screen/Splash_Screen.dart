import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../shared_preference/pref_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/routes.dart';
import 'package:get/get.dart';

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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    String route = PrefController().onBoarding
        ? PrefController().login
            ? menuScreen
            : loginScreen
        : onBoardingOneScreen;
    Future.delayed(
      const Duration(seconds: 6),
      () => Get.offAllNamed(route),
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
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          const Circles(opacity: .45, value: 50, milliseconds: 500),
          const Circles(opacity: .39, value: 100, milliseconds: 800),
          const Circles(opacity: .33, value: 150, milliseconds: 1100),
          const Circles(opacity: .27, value: 200, milliseconds: 1400),
          const Circles(opacity: .21, value: 250, milliseconds: 1700),
          const Circles(opacity: .15, value: 300, milliseconds: 2000),
          const Circles(opacity: .12, value: 350, milliseconds: 2300),
          const Circles(opacity: .10, value: 400, milliseconds: 2600),
          logoWidget(context),
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
          radius: value.h,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.white.withOpacity(opacity),
          lineWidth: 20.w,
          animation: true,
        ),
      ),
    );
  }
}

Widget logoWidget(context) {
  return FadeInDown(
    from: MediaQuery.of(context).size.height / 2,
    delay: const Duration(seconds: 3),
    child: Center(
      child: SvgPicture.asset(
        kLogo,
        alignment: AlignmentDirectional.bottomCenter,
      ),
    ),
  );
}
