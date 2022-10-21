import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Widget/Buttons.dart';
import '../../Widget/Circle_Button.dart';
import '../../Widget/Menu_Choose.dart';
import '../../Widget/Text_Field_Profile.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/strings.dart';
import '../../models/City.dart';

class ServiceProviderRegistrationScreen extends StatefulWidget {
  const ServiceProviderRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<ServiceProviderRegistrationScreen> createState() =>
      _ServiceProviderRegistrationScreenState();
}

class _ServiceProviderRegistrationScreenState
    extends State<ServiceProviderRegistrationScreen> {
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
  XFile? pickedImage;
  late ImagePicker _imagePicker;
  late TextEditingController _phoneEditingController;
  late TextEditingController _nameEditingController;

  late TextEditingController _workEditingController;

  @override
  void initState() {
    super.initState();
    _phoneEditingController = TextEditingController();
    _nameEditingController = TextEditingController();
    _workEditingController = TextEditingController();
    _imagePicker = ImagePicker();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تسجيل كمزود خدمة',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(
          top: 27,
          start: 37,
          end: 37,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('images/saja.jpg'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, bottom: 5),
                    child: CircleButton(
                      height: 30,
                      width: 30,
                      color: Colors.white,
                      icon: Icons.camera_alt,
                      sizeIcon: 15,
                      colorIcon: ColorsApp.s,
                      function: () {
                        personalPicture();
                        setState(() {
                          blur = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 28.4),
          TextFieldProfile(
            keyboardType: TextInputType.text,
            textEditingController: _nameEditingController,
            errorText: 'يرجى إدخال الاسم',
            nameFiled: 'الاسم الكامل',
          ),
          const SizedBox(height: 20),
          TextFieldProfile(
            keyboardType: TextInputType.phone,
            textEditingController: _phoneEditingController,
            errorText: 'يرجى إدخال رقم الجوال',
            nameFiled: 'رقم الجوال',
          ),
          const SizedBox(height: 20),
          TextFieldProfile(
            keyboardType: TextInputType.text,
            textEditingController: _workEditingController,
            errorText: 'يرجى إدخال المهنة',
            nameFiled: 'المهنة',
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
              name: 'تسجيل',
              x: 45,
              y: double.infinity,
              function: () {
                Navigator.pushReplacementNamed(context, provideService);
              },
            ),
          ),
        ],
      ),
    );
  }

  void personalPicture() {
    showModalBottomSheet(
      barrierColor: Colors.white.withAlpha(128),
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) {
        return BottomSheet(
          backgroundColor: ColorsApp.s4,
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
                      color: ColorsApp.s,
                      fontFamily: FontsApp.helveticaL,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleButton(
                            height: 40,
                            width: 40,
                            color: ColorsApp.s4,
                            icon: Icons.image,
                            colorIcon: ColorsApp.s,
                            function: () async => await _pickImageGallery(),
                          ),
                          Text(
                            'المعرض',
                            style: TextStyle(
                              fontSize: 11,
                              color: ColorsApp.s,
                              fontFamily: FontsApp.helveticaL,
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
                            color: ColorsApp.s4,
                            icon: Icons.camera_alt,
                            colorIcon: ColorsApp.s,
                            function: () async => await _pickImageCamera(),
                          ),
                          Text(
                            'الكاميرا',
                            style: TextStyle(
                              fontSize: 11,
                              color: ColorsApp.s.withAlpha(255),
                              fontFamily: FontsApp.helveticaL,
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

  Future<void> _pickImageCamera() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedImage = image;
    }
  }

  Future<void> _pickImageGallery() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage = image;
    }
  }
}
