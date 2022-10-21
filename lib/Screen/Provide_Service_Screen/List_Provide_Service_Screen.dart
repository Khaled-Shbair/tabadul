import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../Widget/Button_AppBar.dart';
import '../../Widget/Buttons.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class ListProvideServiceScreen extends StatefulWidget {
  const ListProvideServiceScreen({Key? key}) : super(key: key);

  @override
  State<ListProvideServiceScreen> createState() =>
      _ListProvideServiceScreenState();
}

class _ListProvideServiceScreenState extends State<ListProvideServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'قائمة مزودي الخدمات',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s,
          ),
        ),
        leadingWidth: 75,
        leading: ButtonAppBar(
          start: 35,
          icon: Icons.menu,
          function: () => ZoomDrawer.of(context)!.toggle(),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsetsDirectional.only(top: 50, start: 37, end: 37),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(end: 10, bottom: 12),
                height: 69,
                width: 72,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: ColorsApp.s4,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.person, size: 30, color: ColorsApp.s),
              ),
              Container(
                alignment: AlignmentDirectional.topCenter,
                margin: const EdgeInsetsDirectional.only(end: 117),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'علي أحمد',
                      style: TextStyle(
                        height: 0,
                        fontSize: 12,
                        fontFamily: FontsApp.helveticaL,
                        color: ColorsApp.s,
                      ),
                    ),
                    Text(
                      'سباك كهربائي',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FontsApp.helveticaL,
                        color: ColorsApp.s,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 15),
                child: Buttons(
                  x: 30,
                  y: 65,
                  fontSize: 10,
                  name: 'اتصل',
                  function: () {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
