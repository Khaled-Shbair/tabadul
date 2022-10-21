import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widget/Button_AppBar.dart';
import '../../Widget/Buttons.dart';
import '../../Widget/Menu_Choose.dart';
import '../../Widget/Text_Field_Profile.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/strings.dart';
import '../../models/City.dart';

class AddInformationScreen extends StatefulWidget {
  const AddInformationScreen({Key? key}) : super(key: key);

  @override
  State<AddInformationScreen> createState() => _AddInformationScreenState();
}

class _AddInformationScreenState extends State<AddInformationScreen> {
  List<City> city = <City>[
    City(name: 'غزة', id: 1),
    City(name: 'خانيونس', id: 2),
    City(name: 'رفع', id: 3),
    City(name: 'النصيرات', id: 4),
    City(name: 'دير البلح', id: 5),
    City(name: 'المغازي', id: 6),
    City(name: 'الزهرة', id: 7),
  ];
  List<City> area = <City>[
    City(name: 'غزة', id: 1),
    City(name: 'خانيونس', id: 2),
    City(name: 'رفع', id: 3),
    City(name: 'النصيرات', id: 4),
    City(name: 'دير البلح', id: 5),
    City(name: 'المغازي', id: 6),
    City(name: 'الزهرة', id: 7),
  ];
  String? selectedCityId;
  String? selectedAreaId;
  bool blur = false;
  late TextEditingController firstNameEditingController;
  late TextEditingController lastNameEditingController;

  @override
  void initState() {
    super.initState();
    firstNameEditingController = TextEditingController();
    lastNameEditingController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameEditingController.dispose();
    lastNameEditingController.dispose();
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
        leadingWidth: 78,
        leading: ButtonAppBar(
          start: 40,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          function: () => Navigator.pop(context),
        ),
        title: Text(
          'إضافة معلومات',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(top: 41, start: 37, end: 37),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/Login and Create Account/Add Information.svg',
          ),
          const SizedBox(height: 45),
          TextFieldProfile(
            keyboardType: TextInputType.text,
            textEditingController: firstNameEditingController,
            errorText: 'يرجى إدخال الاسم الأول',
            nameFiled: 'الاسم الأول',
          ),
          const SizedBox(height: 20),
          TextFieldProfile(
            keyboardType: TextInputType.text,
            textEditingController: lastNameEditingController,
            errorText: 'يرجى إدخال الاسم الأخير',
            nameFiled: 'الاسم الأخير',
          ),
          const SizedBox(height: 20),
          MenuChoose(
            function: (String? value) {
              if (value != null) {
                setState(() {
                  selectedCityId = value;
                });
              }
            },
            selectedId: selectedCityId,
            list: city,
            nameFiled: 'المدينة',
          ),
          const SizedBox(height: 20),
          MenuChoose(
            function: (String? value) {
              if (value != null) {
                setState(() {
                  selectedAreaId = value;
                });
              }
            },
            selectedId: selectedAreaId,
            list: area,
            nameFiled: 'المنطقة / الشارع',
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Buttons(
              name: 'التالي',
              x: 45,
              y: double.infinity,
              function: () => Navigator.pushReplacementNamed(
                  context, accountCreatedSuccessfullyScreen),
            ),
          ),
        ],
      ),
    );
  }
}
