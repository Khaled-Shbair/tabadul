import 'package:flutter/material.dart';
import '../constants/fonts.dart';
import '../constants/colors.dart';
import '../Widget/Button_AppBar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الإشعارات',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
      body: ListView.builder(
        itemCount: 20,
        padding: const EdgeInsetsDirectional.only(top: 20),
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsetsDirectional.only(
              start: 37,
              end: 37,
              bottom: 15,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: ColorsApp.s4,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(width: 8, color: ColorsApp.s),
                Container(
                  height: 74,
                  width: 310,
                  margin: const EdgeInsetsDirectional.only(start: 6, end: 10),
                  child: Text(
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة لقد تم توليد هذا النص من مولد النص العربي حيث يمكنك أن تولد مثل هذا حيث يمكنك أن تولد مثل هذا',
                    style: TextStyle(
                      fontSize: 10,
                      color: ColorsApp.s,
                      fontFamily: FontsApp.helveticaL,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
