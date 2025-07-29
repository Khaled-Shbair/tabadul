import '/config/all_imports.dart';

class CustomImageOfProduct extends StatelessWidget {
  const CustomImageOfProduct({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(ManagerRadius.r4),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }
}
