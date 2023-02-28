import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class ComputerDepartmentScreen extends StatefulWidget {
  const ComputerDepartmentScreen({Key? key}) : super(key: key);

  @override
  State<ComputerDepartmentScreen> createState() =>
      _ComputerDepartmentScreenState();
}

class _ComputerDepartmentScreenState extends State<ComputerDepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 37, end: 37, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                const CircleAvatar(radius: 13, backgroundColor: s4),
                Text(
                  ' قسم أجهزة الحاسوب',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    height: 1.4,
                    fontFamily: kHelveticaL,
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsetsDirectional.only(top: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 136 / 154,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.add, color: primaryColor, size: 50),
                    style: ElevatedButton.styleFrom(
                      primary: s4,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
