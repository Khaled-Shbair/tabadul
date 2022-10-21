import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/strings.dart';
import '../Widget/Buttons.dart';
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
      backgroundColor: ColorsApp.colorScaffold,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsetsDirectional.only(start: 37, end: 37),
        children: [
          const SizedBox(height: 52),
          SvgPicture.asset('images/add product.svg', height: 450),
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: ColorsApp.s,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4),
              Buttons(
                name: 'إضافة سلعة',
                colorFont: ColorsApp.s,
                fontSize: 12,
                color: ColorsApp.s4,
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
