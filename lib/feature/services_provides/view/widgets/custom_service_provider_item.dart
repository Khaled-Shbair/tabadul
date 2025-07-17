import 'package:tabadul/config/all_imports.dart';

class CustomServiceProviderItem extends StatelessWidget {
  const CustomServiceProviderItem({
    required this.serviceProvider,
    super.key,});
 final UserModel serviceProvider;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
        contentPadding: EdgeInsetsDirectional.only(
           bottom:  ManagerHeight.h10
        ),
        leading: Container(
          height: ManagerHeight.h100,
          width: ManagerWidth.w74,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(ManagerRadius.r10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(ManagerRadius.r10),
            child: CachedNetworkImage(
              imageUrl: serviceProvider.imageOfProvideService??'',
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Container(
                color: context.theme.colorScheme.secondary,
                child: Icon(
                  Icons.person,
                  color: context.theme.colorScheme.onSecondary,
                  size: ManagerWidth.w30,
                ),
              ),
            ),
          ),
        ),
        title: Text(

          '${serviceProvider.firstName} ${serviceProvider.lastName}',
          style: context.textTheme.bodyLarge?.copyWith(
            height: ManagerHeight.h2,
          ),
        ),
        subtitle: Text(
          '${serviceProvider.job}' ,
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
                context,
                Routes.detailServiceProvideScreen,
                arguments: serviceProvider,
              );
            },
            child: Text(
              ManagerStrings.call,
              style: context.textTheme.labelLarge,
            ),
          ),
        ),

      );
  }
}
