import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class NewFlutter extends StatefulWidget {
  const NewFlutter({Key? key}) : super(key: key);

  @override
  State<NewFlutter> createState() => _NewFlutterState();
}

class _NewFlutterState extends State<NewFlutter> with TickerProviderStateMixin {
  late AnimationController radiusController;
  late AnimationController centerCircleController;
  late Animation<double> rippleRadius;
  late Animation<double> rippleOpacity;
  late Animation<double> centerCircleRadius;

  @override
  void initState() {
    super.initState();

    radiusController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    rippleRadius = Tween<double>(begin: 0, end: 150)
        .animate(CurvedAnimation(parent: radiusController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          radiusController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          radiusController.forward();
        }
      });
    rippleOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: radiusController,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });
    //////////////////
    centerCircleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1250));
    centerCircleRadius = Tween<double>(begin: 22, end: 16).animate(
      CurvedAnimation(
        parent: centerCircleController,
        reverseCurve: Curves.easeInOut,
        curve: Curves.ease,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          centerCircleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          centerCircleController.forward();
        }
      });
    Timer(const Duration(milliseconds: 1600), () {
      radiusController.forward();
    });
    centerCircleController.forward();
  }

  @override
  void dispose() {
    centerCircleController.dispose();
    radiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFF464698),
      appBar: AppBar(
        title: const Text('Custom Paint'),
      ),
      body: Center(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: CustomPaint(
            painter: MyPainter(
              rippleRadius.value,
              rippleOpacity.value,
              centerCircleRadius.value,
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  double rippleRadius, rippleOpacity, centerCircleRadius;

  MyPainter(this.rippleRadius, this.rippleOpacity, this.centerCircleRadius);

  void s(double radius) {
    CircularPercentIndicator(
      curve: Curves.bounceOut,
      radius: radius,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.white.withOpacity(.45),
      lineWidth: 20,
      animation: true,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    var firstPaint = Paint()
      ..color = Colors.blue.withOpacity(rippleOpacity)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.5), rippleRadius, firstPaint);

    var secondPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 60, secondPaint);
    var thirdPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.5), 50, thirdPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
