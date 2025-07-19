import '/config/all_imports.dart';

class ListServicesProvidersScreen extends StatelessWidget {
  const ListServicesProvidersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerStrings.listServiceProvide,
        functionLeadingButton: () {
          disposeListServiceProvide();
          Navigator.pop(context);
        },
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
          final serviceProvider = [
            UserModel(
              city: 'غزة',
              firstName: 'خالد',
              lastName: 'شبير',
              job: 'عامل كهربائي',
              imageOfProvideService: instance<SharedPreferencesController>()
                  .getString(SharedPreferenceKeys.imageOfProvideService),
            ),
          ];
          return CustomServiceProviderItem(serviceProvider: serviceProvider[0]);
        },
      ),
    );
  }
}
