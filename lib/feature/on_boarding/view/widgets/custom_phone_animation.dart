import '/config/all_imports.dart';

class CustomPhoneRightAnimation extends StatelessWidget {
  const CustomPhoneRightAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      delay: const Duration(seconds: 2),
      from: ManagerHeight.h20,
      child: _phoneImage(ManagerAssets.rightPhone),
    );
  }
}

class CustomPhoneLeftAnimation extends StatelessWidget {
  const CustomPhoneLeftAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      from: ManagerHeight.h10,
      delay: const Duration(seconds: 2),
      child: _phoneImage(ManagerAssets.leftPhone),
    );
  }
}

Widget _phoneImage(String imagePhonePath) {
  return Center(
    child: SvgPicture.asset(
      imagePhonePath,
      height: ManagerHeight.h190,
    ),
  );
}
