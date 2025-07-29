import '/config/all_imports.dart';

class AddedProductSuccessfullyScreen extends StatelessWidget {
  const AddedProductSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        functionLeadingButton: () {
          Navigator.pop(context);
          disposeAddProduct();
        },
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w78,
          end: ManagerWidth.w76,
          top: ManagerHeight.h122,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            ManagerAssets.addedProductSuccessfully,
            height: ManagerHeight.h193,
            width: ManagerWidth.w206,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: ManagerHeight.h30,
              start: ManagerWidth.w10,
              end: ManagerWidth.w10,
            ),
            child: Text(
              ManagerStrings.addedProductSuccessfully,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(height: 1.5.h),
            ),
          ),
          verticalSpace(ManagerHeight.h30),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w50,
              end: ManagerWidth.w50,
            ),
            child: CustomButton(
              minWidth: ManagerWidth.w106,
              onPressed: () {
                Navigator.pop(context);
                disposeAddProduct();
              },
              child: Text(
                ManagerStrings.done,
                style: context.textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
