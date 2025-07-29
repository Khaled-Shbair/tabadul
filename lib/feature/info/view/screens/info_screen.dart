import '/config/all_imports.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        functionLeadingButton: () {
          Navigator.pop(context);
        },
        functionActionButton: () {
          ZoomDrawer.of(context)?.open();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: ManagerHeight.h39,
            ),
            child: SvgPicture.asset(
              ManagerAssets.info,
              height: ManagerHeight.h73,
              width: ManagerWidth.w184,
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SvgPicture.asset(
                ManagerAssets.backgroundBoxInfo,
                width: ManagerWidth.infinity,
                height: ManagerHeight.h525,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w37,
                  end: ManagerWidth.w36,
                  top: ManagerHeight.h30,
                ),
                child: Text(
                  ManagerStrings.infoApplication,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.titleSmall
                      ?.copyWith(height: ManagerHeight.h2),
                ),
              ),
            ],
        ),
        ],
      ),
    );
  }
}
