import '/config/all_imports.dart';

class CustomBoxOfAddPhotoOfProduct extends StatelessWidget {
  const CustomBoxOfAddPhotoOfProduct({
    required this.eventBuilder,
    required this.click,
    this.fileImage,
    super.key,
  });
  final bool click;
  final File? fileImage;
  final AddProductEvent Function(String image) eventBuilder;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductState>(
      builder: (context, state) {
        var controller = context.read<AddProductBloc>();
        return InkWell(
          onTap: () {
            customImageSelectionBox(
              context,
              onTapCamera: () async {
                final XFile? image =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (image != null) {
                  controller.add(eventBuilder(image.path));
                  if (context.mounted) {
                    final navigator =
                        Navigator.of(context, rootNavigator: true);
                    if (navigator.canPop()) {
                      navigator.pop();
                    }
                  }
                }
              },
              onTapGallery: () async {
                final XFile? image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image != null) {
                  controller.add(eventBuilder(image.path));
                  if (context.mounted) {
                    final navigator =
                        Navigator.of(context, rootNavigator: true);
                    if (navigator.canPop()) {
                      navigator.pop();
                    }
                  }
                }
              },
            );
          },
          child: Container(
            width: ManagerWidth.w90,
            height: ManagerHeight.h85,
            decoration: BoxDecoration(
              color: click
                  ? context.theme.colorScheme.secondary
                  : context.theme.primaryColor,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              image: fileImage != null
                  ? DecorationImage(
                      image: FileImage(fileImage!),
                      fit: BoxFit.fill,
                    )
                  : null,
            ),
            child: fileImage == null
                ? Icon(
                    Icons.camera_alt,
                    size: ManagerIconsSizes.i24,
                    color: click
                        ? context.theme.primaryColor
                        : context.theme.colorScheme.secondary,
                  )
                : null,
          ),
        );
      },
    );
  }
}
