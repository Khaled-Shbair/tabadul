import 'package:flutter/material.dart';
import '../constants/fonts.dart';
import '../constants/strings.dart';
import '../Widget/Button_AppBar.dart';
import '../Widget/Buttons.dart';
import '../constants/colors.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تفاصيل السلعة',
          style: TextStyle(
            fontSize: 20,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s,
          ),
        ),
        leadingWidth: 78,
        leading: ButtonAppBar(
          start: 40,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          function: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(start: 37, end: 37, top: 10),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              childAspectRatio: 136 / 153,
            ),
            children: const [
              Photo(),
              Photo(),
              Photo(),
              Photo(),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                children: const [
                  Detail(text: 'الاسم'),
                  Detail(text: 'السعر'),
                  Detail(text: 'الوصف'),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: const [
                  Detail(
                    start: 10,
                    width: 257,
                    text: 'HP ProBook 430 G7 Laptop',
                  ),
                  Detail(start: 10, width: 257, text: '500 شيكل'),
                  Detail(
                    start: 10,
                    end: 10,
                    width: 257,
                    text: 'هذا الجهاز تم استخدامه فقط مدة 12 يوم',
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 20, end: 20, top: 25),
            child: Buttons(
              name: 'شراء الآن',
              x: 45,
              function: () =>
                  Navigator.pushNamed(context, readyToReceiveScreen),
            ),
          ),
        ],
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({
    Key? key,
    required this.text,
    this.width = 70,
    this.start = 3,
    this.end = 3,
  }) : super(key: key);
  final String text;
  final double width;
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      padding: EdgeInsetsDirectional.only(start: start, end: end, bottom: 5),
      alignment: AlignmentDirectional.center,
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: ColorsApp.s4,
        borderRadius: BorderRadius.circular(4),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: FontsApp.helveticaL,
            fontSize: 12,
            color: ColorsApp.s,
          ),
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.s4,
        borderRadius: BorderRadius.circular(4),
      ),
      // child: Image.asset('images/saja.jpg', fit: BoxFit.fill),
    );
  }
}
