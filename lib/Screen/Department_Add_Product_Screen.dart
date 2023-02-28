import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/routes.dart';
import '../Widget/custom_button.dart';
import '../constants/colors.dart';

class DepartmentAddProductScreen extends StatefulWidget {
  const DepartmentAddProductScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentAddProductScreen> createState() =>
      _DepartmentAddProductScreenState();
}

class _DepartmentAddProductScreenState
    extends State<DepartmentAddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsetsDirectional.only(start: 37, end: 37),
        children: [
          const SizedBox(height: 52),
          SvgPicture.asset('images/add_product.svg', height: 450),
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4),
              CustomButton(
                name: 'إضافة سلعة',
                colorFont: primaryColor,
                fontSize: 12,
                color: s4,
                x: 45,
                y: 140,
                function: () => Navigator.pushNamed(context, addProductScreen),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
