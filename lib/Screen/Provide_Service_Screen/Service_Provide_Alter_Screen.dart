import 'package:flutter/material.dart';
import '../../Widget/custom_circle_button.dart';
import '../../constants/routes.dart';
import '../../Widget/custom_button.dart';
import '../../Widget/Circle_Button.dart';
import '../../Widget/custom_menu_choose.dart';
import '../../Widget/custom_text_field.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../models/city_model.dart';

class ServiceProviderAlterScreen extends StatefulWidget {
  const ServiceProviderAlterScreen({Key? key}) : super(key: key);

  @override
  State<ServiceProviderAlterScreen> createState() =>
      _ServiceProviderAlterScreenState();
}

class _ServiceProviderAlterScreenState
    extends State<ServiceProviderAlterScreen> {
  List<CityModel> city = <CityModel>[
    CityModel(nameAr: 'غزة', id: 1),
    CityModel(nameAr: 'خانيونس', id: 2),
    CityModel(nameAr: 'رفع', id: 3),
    CityModel(nameAr: 'النصيرات', id: 4),
    CityModel(nameAr: 'دير البلح', id: 5),
    CityModel(nameAr: 'المغازي', id: 6),
    CityModel(nameAr: 'الزهرة', id: 7),
  ];
  List<CityModel> area = <CityModel>[
    CityModel(nameAr: 'غزة', id: 1),
    CityModel(nameAr: 'خانيونس', id: 2),
    CityModel(nameAr: 'رفع', id: 3),
    CityModel(nameAr: 'النصيرات', id: 4),
    CityModel(nameAr: 'دير البلح', id: 5),
    CityModel(nameAr: 'المغازي', id: 6),
    CityModel(nameAr: 'الزهرة', id: 7),
  ];
  String? selectedCityId;
  String? selectedAreaId;
  late TextEditingController _phoneEditingController;
  late TextEditingController _nameEditingController;
  late TextEditingController _workEditingController;

  @override
  void initState() {
    super.initState();
    _phoneEditingController = TextEditingController();
    _nameEditingController = TextEditingController();
    _workEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneEditingController.dispose();
    _nameEditingController.dispose();
    _workEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 60,
        leading: CustomCircleButton(
          start: 25,
          paddingStart: 15,
          icon: Icons.arrow_back_ios,
          size: 15,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'تعديل الملف الشخصي(مزود خدمة)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: kHelveticaL,
            color: primaryColor,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(start: 37, top: 20, end: 37),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    height: 170,
                    width: 300,
                    color: s4,
                    child:
                        const Icon(Icons.person, size: 80, color: primaryColor),
                  ),
                  CircleButton(
                    height: 35,
                    width: 35,
                    color: primaryColor,
                    icon: Icons.camera_alt,
                    sizeIcon: 18,
                    colorIcon: Colors.white,
                    function: () => personalPicture(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 33),
          CustomTextField(
            keyboardType: TextInputType.text,
            textEditingController: _nameEditingController,
            nameFiled: 'الاسم الكامل',
            errorText: 'يرجى إدخال الاسم',
            sizeSuffixIcon: 20,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            keyboardType: TextInputType.phone,
            textEditingController: _nameEditingController,
            nameFiled: 'رقم الجوال',
            errorText: 'يرجى إدخال رقم الجوال',
            sizeSuffixIcon: 20,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            keyboardType: TextInputType.text,
            textEditingController: _workEditingController,
            nameFiled: 'المهنة',
            errorText: 'يرجى إدخال المهنة',
            sizeSuffixIcon: 20,
          ),
          const SizedBox(height: 20),
          CustomMenuChoose(
            name: 'nameAr',
            function: (String? value) {
              if (value != null) {
                setState(() {
                  selectedCityId = value;
                });
              }
            },
            selectedId: selectedCityId,
            icon: Icons.create,
            size: 20,
            list: city,
            nameFiled: 'المدينة',
          ),
          const SizedBox(height: 20),
          CustomMenuChoose(
            name: 'nameAr',

            function: (String? value) {
              if (value != null) {
                setState(() {
                  selectedAreaId = value;
                });
              }
            },
            icon: Icons.create,
            size: 20,
            selectedId: selectedAreaId,
            list: area,
            nameFiled: 'المنطقة / الشارع',
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: CustomButton(
              name: 'حفظ',
              x: 45,
              y: double.infinity,
              function: () => Navigator.pushReplacementNamed(
                  context, profileProvideServiceScreen),
            ),
          ),
        ],
      ),
    );
  }

  void personalPicture() {
    showModalBottomSheet(
      barrierColor: Colors.white.withAlpha(220),
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) {
        return BottomSheet(
          backgroundColor: s4,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
            ),
          ),
          onClosing: () {},
          builder: (context) {
            return SizedBox(
              height: 163,
              width: double.infinity,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsetsDirectional.only(top: 32, start: 37),
                children: [
                  Text(
                    'الصورة الشخصية',
                    style: TextStyle(
                      fontSize: 17,
                      color: primaryColor,
                      fontFamily: kHelveticaL,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleButton(
                            height: 40,
                            width: 40,
                            color: s4,
                            icon: Icons.image,
                            colorIcon: primaryColor,
                            function: () {},
                          ),
                          Text(
                            'المعرض',
                            style: TextStyle(
                              fontSize: 11,
                              color: primaryColor,
                              fontFamily: kHelveticaL,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 21),
                      Column(
                        children: [
                          CircleButton(
                            height: 40,
                            width: 40,
                            color: s4,
                            icon: Icons.camera_alt,
                            colorIcon:primaryColor,
                            function: () {},
                          ),
                          Text(
                            'الكاميرا',
                            style: TextStyle(
                              fontSize: 11,
                              color:primaryColor.withAlpha(255),
                              fontFamily: kHelveticaL,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
