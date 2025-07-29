import '/config/all_imports.dart';

class AnswerIsYesScreen extends StatelessWidget {
  const AnswerIsYesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        functionLeadingButton: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w38,
          end: ManagerWidth.w36,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ManagerAssets.answerIsYes,
              height: ManagerHeight.h224,
              width: ManagerWidth.w237,
            ),
            verticalSpace(ManagerHeight.h47),
            SizedBox(
              height: ManagerHeight.h63,
              width: ManagerWidth.infinity,
              child: Text(
                ManagerStrings.titleAnswerIsYesScreen,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w90,
                end: ManagerWidth.w90,
                top: ManagerHeight.h43,
              ),
              child: CustomButton(
                minWidth: ManagerWidth.w106,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(ManagerStrings.okay,
                    style: context.textTheme.labelLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
