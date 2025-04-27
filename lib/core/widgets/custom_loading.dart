import '/config/all_imports.dart';

void customLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    useSafeArea: false,
    barrierColor: ManagerColors.black70,
    builder: (context) {
      return Center(
        child: SizedBox(
          height: ManagerHeight.h60,
          width: ManagerWidth.w60,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w10,
                end: ManagerWidth.w10,
                top: ManagerHeight.h10,
                bottom: ManagerHeight.h10,
              ),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    },
  );
}
