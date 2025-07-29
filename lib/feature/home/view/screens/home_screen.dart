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
                tableName: _allDepartments[index].tableName,
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
    tableName: FirebaseConstants.furnitureDepartmentTable,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.carpet,
    nameDepartment: ManagerStrings.carpetsAndMattressesDepartment,
    tableName: FirebaseConstants.carpetsAndMattressesDepartmentTable,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.phone,
    nameDepartment: ManagerStrings.phoneDepartment,
    tableName: FirebaseConstants.phoneDepartmentTable,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.computer,
    nameDepartment: ManagerStrings.computerDepartment,
    tableName: FirebaseConstants.computerDepartmentTable,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.motorcycle,
    nameDepartment: ManagerStrings.motorcycleDepartment,
    tableName: FirebaseConstants.motorcycleDepartmentTable,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.bicycle,
    nameDepartment: ManagerStrings.bicycleDepartment,
    tableName: FirebaseConstants.bicycleDepartmentTable,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.car,
    nameDepartment: ManagerStrings.carDepartment,
    tableName: FirebaseConstants.carDepartmentTable,
  ),
  CustomDepartmentBox(
    pathImage: ManagerAssets.electricMachines,
    nameDepartment: ManagerStrings.electricMachinesDepartment,
    tableName: FirebaseConstants.electricMachinesDepartmentTable,
  ),
];
