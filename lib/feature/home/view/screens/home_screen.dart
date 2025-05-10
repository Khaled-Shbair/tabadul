import '/config/all_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerStrings.home,
        iconLeading: Icons.menu,
        functionLeadingButton: () => ZoomDrawer.of(context)?.open(),
      ),
      body: GridView(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w37,
          end: ManagerWidth.w36,
          top: ManagerHeight.h20,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: ManagerWidth.w16,
          mainAxisSpacing: ManagerHeight.h16,
          childAspectRatio: ManagerWidth.w135 / ManagerHeight.h126,
        ),
        children: [
          ...List.generate(
            _allDepartments.length,
            (index) {
              return CustomDepartmentBox(
                nameDepartment: _allDepartments[index].nameDepartment,
                pathImage: _allDepartments[index].pathImage,
              );
            },
          ),
        ],
      ),
    );
  }
}

List<CustomDepartmentBox> _allDepartments = <CustomDepartmentBox>[
  CustomDepartmentBox(
    pathImage: ManagerAssets.furniture,
    nameDepartment: ManagerStrings.furnitureDepartment,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.carpet,
    nameDepartment: ManagerStrings.carpetsAndMattressesDepartment,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.phone,
    nameDepartment: ManagerStrings.phoneDepartment,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.computer,
    nameDepartment: ManagerStrings.computerDepartment,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.motorcycle,
    nameDepartment: ManagerStrings.motorcycleDepartment,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.bicycle,
    nameDepartment: ManagerStrings.bicycleDepartment,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.car,
    nameDepartment: ManagerStrings.carDepartment,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.electricMachines,
    nameDepartment: ManagerStrings.electricMachinesDepartment,
  ),
];
