import '/config/all_imports.dart';

class ProfileProvideServiceScreen extends StatefulWidget {
  const ProfileProvideServiceScreen({super.key});

  @override
  State<ProfileProvideServiceScreen> createState() =>
      _ProfileProvideServiceScreenState();
}

class _ProfileProvideServiceScreenState
    extends State<ProfileProvideServiceScreen> {
  @override
  Widget build(BuildContext context) {
    var sharedPref = instance<SharedPreferencesController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerStrings.profileProvideService,
        iconLeading: Icons.menu,
        iconAction: Icons.edit,
        titleStyle: context.textTheme.titleSmall?.copyWith(
          color: context.theme.primaryColor,
        ),
        functionLeadingButton: () => ZoomDrawer.of(context)?.open(),
        functionActionButton: () {
          Navigator.pushNamed(context, Routes.editProfileProvideServiceScreen)
              .then(
            (value) {
              if (value == true) {
                setState(() {});
              }
            },
          );
        },
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h30,
          bottom: ManagerHeight.h34,
          start: ManagerWidth.w38,
          end: ManagerWidth.w36,
        ),
        primary: false,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: ManagerRadius.r67,
                backgroundImage: CachedNetworkImageProvider(
                  sharedPref
                      .getString(SharedPreferenceKeys.imageOfProvideService),
                ),
              ),
            ],
          ),
          verticalSpace(ManagerHeight.h20),
          CustomTextField(
            initialValue:
                '${sharedPref.getString(SharedPreferenceKeys.firstName)} ${sharedPref.getString(SharedPreferenceKeys.lastName)}',
            readOnly: true,
          ),
          verticalSpace(ManagerHeight.h10),
          CustomTextField(
            initialValue:
                sharedPref.getString(SharedPreferenceKeys.phoneNumber),
            readOnly: true,
          ),
          verticalSpace(ManagerHeight.h10),
          CustomTextField(
            initialValue: sharedPref.getString(SharedPreferenceKeys.job),
            readOnly: true,
          ),
          verticalSpace(ManagerHeight.h10),
          CustomTextField(
            initialValue:
                sharedPref.getString(SharedPreferenceKeys.regionAndStreet),
            readOnly: true,
          ),
          verticalSpace(ManagerHeight.h10),
          CustomTextField(
            initialValue: sharedPref.getString(SharedPreferenceKeys.city),
            readOnly: true,
          ),
          verticalSpace(ManagerHeight.h10),
          CustomTextField(
            initialValue:
                sharedPref.getString(SharedPreferenceKeys.description),
            readOnly: true,
            contentPadding: EdgeInsetsDirectional.only(
              end: ManagerWidth.w20,
              start: ManagerWidth.w20,
              top: ManagerHeight.h10,
              bottom: ManagerHeight.h10,
            ),
            hintMaxLines: 4,
            maxLines: 4,
            maxLength: 120,
          ),
        ],
      ),
    );
  }
}
