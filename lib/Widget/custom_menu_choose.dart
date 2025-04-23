import '/config/all_imports.dart';

class CustomMenuChooseCodeCountry extends StatelessWidget {
  const CustomMenuChooseCodeCountry({
    required this.selectedId,
    required this.list,
    required this.function,
    super.key,
  });

  final String? selectedId;
  final List<CodeCountryModel> list;

  final Function(String? value) function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w8,
        end: ManagerWidth.w5,
      ),
      alignment: AlignmentDirectional.center,
      width: ManagerWidth.w73,
      height: ManagerHeight.h45,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(ManagerRadius.r4),
      ),
      child: DropdownButton<String>(
        value: selectedId,
        borderRadius: BorderRadius.circular(ManagerRadius.r4),
        hint: Text(selectedId.toString(), style: context.textTheme.displaySmall),
        underline: SizedBox.shrink(),
        dropdownColor: context.theme.colorScheme.secondary,
        style: context.textTheme.displaySmall,
        icon: Icon(
          Icons.keyboard_arrow_down,
          size: ManagerIconsSizes.i20,
          color: context.theme.primaryColor,
        ),
        isExpanded: true,
        elevation: 0,
        iconEnabledColor: context.theme.primaryColor,
        items: list
            .map(
              (e) => DropdownMenuItem<String>(
                value: e.id.toString(),
                child: Text(
                  e.name,
                  style: context.textTheme.displaySmall,
                ),
              ),
            )
            .toList(),
        onChanged: function,
      ),
    );
  }
}
