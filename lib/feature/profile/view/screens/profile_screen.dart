import '/config/all_imports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var sharedPref = instance<SharedPreferencesController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerStrings.profile,
        iconLeading: Icons.menu,
        functionLeadingButton: () => ZoomDrawer.of(context)?.open(),
        iconAction: Icons.edit,
        functionActionButton: () {
          Navigator.pushNamed(context, Routes.editProfileScreen).then(
            (result) {
              if (result == true) {
                setState(() {});
              }
            },
          );
        },
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h96,
          start: ManagerWidth.w38,
          end: ManagerWidth.w36,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              height: ManagerHeight.h272,
              margin: EdgeInsetsDirectional.only(
                top: 80.h,
              ),
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeight.h49,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(ManagerRadius.r20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${sharedPref.getString(SharedPreferenceKeys.firstName)} ${sharedPref.getString(SharedPreferenceKeys.lastName)}',
                    style: context.textTheme.headlineLarge,
                  ),
                  verticalSpace(ManagerHeight.h50),
                  CustomPersonalData(
                    ManagerStrings.phoneNumber,
                    sharedPref.getString(SharedPreferenceKeys.phoneNumber),
                  ),
                  verticalSpace(ManagerHeight.h25),
                  CustomPersonalData(
                    ManagerStrings.city,
                    sharedPref.getString(SharedPreferenceKeys.city),
                  ),
                  verticalSpace(ManagerHeight.h25),
                  CustomPersonalData(
                    ManagerStrings.region,
                    sharedPref.getString(SharedPreferenceKeys.regionAndStreet),
                  ),
                ],
              ),
            ),
            CachedNetworkImage(
              imageUrl: sharedPref.getString(SharedPreferenceKeys.image),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: ManagerRadius.r56,
                backgroundColor: context.theme.colorScheme.primaryContainer,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => CircleAvatar(
                radius: ManagerRadius.r56,
                backgroundColor: context.theme.colorScheme.primaryContainer,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: ManagerRadius.r56,
                backgroundColor: context.theme.colorScheme.primaryContainer,
                child: Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
