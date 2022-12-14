import 'package:flutter/material.dart';

import '../Widget/Button_AppBar.dart';
import '../Widget/Buttons.dart';
import '../Widget/Text_Field_Profile.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/strings.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool click1 = true;
  bool click2 = true;
  bool click3 = true;
  bool click4 = true;
  late TextEditingController productNameEditingController;
  late TextEditingController priceEditingController;

  @override
  void initState() {
    super.initState();
    productNameEditingController = TextEditingController();
    priceEditingController = TextEditingController();
  }

  @override
  void dispose() {
    productNameEditingController.dispose();
    priceEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'إضافة سلعة',
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
      body: ListView(
        padding: const EdgeInsetsDirectional.only(start: 37, end: 37, top: 20),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsetsDirectional.only(start: 43, end: 43),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 90 / 85,
            ),
            children: [
              ElevatedButton(
                onPressed: () {
                  if (click4 == true && click2 == true && click3 == true) {
                    setState(() {
                      click1 = !click1;
                    });
                  }
                },
                child: Icon(
                  Icons.camera_alt,
                  color: click1 ? ColorsApp.s : ColorsApp.s4,
                ),
                style: ElevatedButton.styleFrom(
                  primary: click1 ? ColorsApp.s4 : ColorsApp.s,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (click1 == true && click4 == true && click3 == true) {
                    setState(() {
                      click2 = !click2;
                    });
                  }
                },
                child: Icon(
                  Icons.camera_alt,
                  color: click2 ? ColorsApp.s : ColorsApp.s4,
                ),
                style: ElevatedButton.styleFrom(
                  primary: click2
                      ? const Color(0XFFF1F1F9)
                      : const Color(0XFF464698),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (click1 == true && click2 == true && click4 == true) {
                    setState(() {
                      click3 = !click3;
                    });
                  }
                },
                child: Icon(
                  Icons.camera_alt,
                  color: click3 ? ColorsApp.s : ColorsApp.s4,
                ),
                style: ElevatedButton.styleFrom(
                  primary: click3 ? ColorsApp.s4 : ColorsApp.s,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (click1 == true && click2 == true && click3 == true) {
                    setState(() {
                      click4 = !click4;
                    });
                  }
                },
                child: Icon(
                  Icons.camera_alt,
                  color: click4 ? ColorsApp.s : ColorsApp.s4,
                ),
                style: ElevatedButton.styleFrom(
                  primary: click4 ? ColorsApp.s4 : ColorsApp.s,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          TextFieldProfile(
            keyboardType: TextInputType.text,
            textEditingController: productNameEditingController,
            errorText: 'يرجى إدخال اسم السلعة',
            nameFiled: 'اسم السلعة',
          ),
          const SizedBox(height: 20),
          TextFieldProfile(
            keyboardType: TextInputType.text,
            textEditingController: priceEditingController,
            errorText: 'يرجى إدخال السعر',
            nameFiled: 'السعر',
          ),
          const SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.text,
            cursorColor: ColorsApp.s,
            maxLines: 4,
            maxLength: 4,
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontsApp.helveticaL,
              color: ColorsApp.s.withAlpha(204),
            ),
            decoration: InputDecoration(
              counterText: '',
              contentPadding:
                  const EdgeInsetsDirectional.only(start: 20, top: 13),
              hintText: 'وصف عن السلعة',
              hintMaxLines: 4,
              hintStyle: TextStyle(
                fontSize: 10,
                fontFamily: FontsApp.helveticaL,
                color: ColorsApp.s.withAlpha(204),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4),
              ),
              fillColor: ColorsApp.s4,
              filled: true,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Buttons(
              name: 'إضافة',
              x: 45,
              function: () =>
                  Navigator.pushNamed(context, addedSuccessfullyScreen),
            ),
          ),
        ],
      ),
    );
  }
}
