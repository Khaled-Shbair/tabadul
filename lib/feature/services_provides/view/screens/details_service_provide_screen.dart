import '/config/all_imports.dart';

class DetailsServiceProvideScreen extends StatelessWidget {
  const DetailsServiceProvideScreen({
    required this.user,
    super.key,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        title: '',
        functionLeadingButton: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: SizedBox(
              height: ManagerHeight.h360,
              width: ManagerWidth.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: user.image ?? '',
                height: ManagerHeight.infinity,
                width: ManagerWidth.infinity,
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: ManagerIconsSizes.i30,
                ),
                progressIndicatorBuilder: (context, url, progress) =>
                    CustomLoading(),
              ),
            ),
          ),
          Container(
            height: ManagerHeight.h433,
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(
              top: ManagerHeight.h13,
              start: ManagerWidth.w58,
              end: ManagerWidth.w36,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ManagerRadius.r30),
                topRight: Radius.circular(ManagerRadius.r30),
              ),
              color: context.theme.colorScheme.surface,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(
                    bottom: ManagerHeight.h18,
                  ),
                  height: ManagerHeight.h4,
                  width: ManagerWidth.w75,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(ManagerWidth.w20),
                  ),
                ),
                Text(
                  '${user.firstName} ${user.lastName}',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineMedium,
                ),
                verticalSpace(ManagerHeight.h20),
                CustomWidgetDetailsServiceProvide(user.job ?? ''),
                verticalSpace(ManagerHeight.h12),
                CustomWidgetDetailsServiceProvide(
                    'مدينة ${user.city} / ${user.regionAndStreet}'),
                verticalSpace(ManagerHeight.h12),
                CustomWidgetDetailsServiceProvide('${user.phoneNumber}'),
                verticalSpace(ManagerHeight.h12),
                CustomWidgetDetailsServiceProvide(
                  '${user.description}',
                  maxLines: 4,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w52,
                    end: ManagerWidth.w74,
                    top: ManagerHeight.h38,
                  ),
                  child: CustomButton(
                    child: Text(
                      ManagerStrings.call,
                      style: context.textTheme.titleSmall,
                    ),
                    onPressed: () {
                      if (user.phoneNumber != null) {
                        callPhone(user.phoneNumber!);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
