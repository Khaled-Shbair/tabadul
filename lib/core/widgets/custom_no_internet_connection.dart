import '/config/all_imports.dart';

class CustomNoInternetConnection extends StatelessWidget {
  const CustomNoInternetConnection({required this.refreshButton,
    super.key,
  });

final  Function() refreshButton;
  @override
  Widget build(BuildContext  context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_connected_no_internet_4,
            size: ManagerWidth.w81,
            color: ManagerColors.errorColor,
          ),
          verticalSpace(ManagerHeight.h20),
          Text(
            ManagerStrings.noInternetConnection,
            style: context.textTheme.headlineSmall?.copyWith(
              color: ManagerColors.errorColor,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(ManagerHeight.h20),
          Padding(padding:
          EdgeInsetsDirectional.symmetric(
            horizontal: ManagerWidth.w81,
          ),
            child:  CustomButton(
              onPressed: refreshButton,
              textButton: ManagerStrings.refresh,
            ),),
        ],
      ),
    );
  }
}
