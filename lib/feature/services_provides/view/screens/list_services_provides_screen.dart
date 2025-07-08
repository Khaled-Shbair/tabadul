import '/config/all_imports.dart';

class ListServicesProvidesScreen extends StatelessWidget {
  const ListServicesProvidesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerStrings.listServiceProvide,
        functionLeadingButton: () {
          disposeListServiceProvide();
          Navigator.pop(context);
        },
        // functionActionButton: () =>
        //   ZoomDrawer.of(context)?.open(),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w38,
          end: ManagerWidth.w36,
          top: ManagerHeight.h15,
          bottom: ManagerHeight.h15,
        ),
        itemBuilder: (context, index) {
          return ListTile(

            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
              height: ManagerHeight.h70,
              width: ManagerWidth.w74,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(instance<SharedPreferencesController>().getString(SharedPreferenceKeys.imageOfProvideService)),
                ),
              ),
            ),
            title: Text(
              'علي أحمد', // name
              style: context.textTheme.bodyLarge?.copyWith(
                height: ManagerHeight.h2,
              ),
            ),
            subtitle: Text(
              'عامل دهان', // job
              style: context.textTheme.bodyLarge?.copyWith(
                fontFamily: ManagerFontFamily.kHelveticaLNeeL,
              ),
            ),
            trailing: SizedBox(
              width: ManagerWidth.w62,
              height: ManagerHeight.h30,
              child: CustomButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context, Routes.detailServiceProvideScreen,
                    // arguments: userModel, // data of user
                  );
                },
                child: Text(
                  ManagerStrings.call,
                  style: context.textTheme.labelLarge
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
