import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/fonts.dart';
import '../constants/colors.dart';
import '../Widget/Button_AppBar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 78,
        leading: ButtonAppBar(
          start: 40,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          function: () => Navigator.pop(context),
        ),
        actions: [
          ButtonAppBar(
            end: 40,
            icon: Icons.menu,
            function: () {
              ZoomDrawer.of(context)!.toggle();
            },
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            children: [
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 40),
                child: SvgPicture.asset(
                  'images/Info.svg',
                  height: 90,
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: ClipPath(
              clipper: CustomClipPath1(),
              child: Container(
                margin: const EdgeInsetsDirectional.only(
                  start: 18,
                  end: 4.5,
                  top: 250,
                ),
                decoration: BoxDecoration(
                  color: ColorsApp.s5.withAlpha(255),
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(40)),
                ),
                width: double.infinity,
                height: 400,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: ClipPath(
              clipper: CustomClipPath2(),
              child: Container(
                margin: const EdgeInsetsDirectional.only(
                  start: 18,
                  end: 4.5,
                  top: 260,
                ),
                decoration: BoxDecoration(
                  color: ColorsApp.s6.withAlpha(153),
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(40)),
                ),
                width: double.infinity,
                height: 400,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: ClipPath(
              clipper: CustomClipPath3(),
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                  start: 30,
                  end: 30,
                  top: 30,
                ),
                decoration: const BoxDecoration(
                  color: ColorsApp.s,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(40)),
                ),
                width: double.infinity,
                height: 505,
                child: Center(
                  child: Text(
                    ' هذا النص هو مثال لنص يمكن أن يستبدل في\n'
                    'نفس المساحة، لقد تم توليد هذا النص من مولد\n'
                    '  النص العربى، حيث يمكنك أن تولد مثل هذا\n'
                    'النص أو العديد من النصوص الأخرى إضافة إلى\n'
                    ' زيادة عدد الحروف التى يولدها التطبيق إذا كنت\n'
                    'النص العربى زيادة عدد الفقرات كما تريد، النص\n'
                    ' لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد\n'
                    'النص العربى مفيد لمصممي المواقع على وجه\n'
                    'الأحيان أن يطلع على صورة حقيقية لتصميم\n'
                    '                             الموقع\n',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontsApp.helveticaL,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 410);
    path.lineTo(0, size.height - 325);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 410);
    path.lineTo(0, size.height - 336);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomClipPath3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 511);
    path.lineTo(0, size.height - 455);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
