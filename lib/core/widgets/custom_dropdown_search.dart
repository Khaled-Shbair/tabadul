import '/config/all_imports.dart';

class CustomDropdownSearch extends StatelessWidget {
  const CustomDropdownSearch({
    required this.hintText,
    required this.items,
    required this.onChangedFunction,
    this.validator,
    this.selectedItem,
    this.textInputAction,
    super.key,
  });

  final String? selectedItem;
  final String hintText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final List<String> items;
  final Function(String? v) onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: (filter, loadProps) => items,
      validator: validator,
      itemAsString: (item) => item,
      compareFn: (item, selectedItem) => item == selectedItem,
      onChanged: (v) {
        FocusScope.of(context).unfocus();
        onChangedFunction(v);
      },
      selectedItem: selectedItem,
      suffixProps: DropdownSuffixProps(
        dropdownButtonProps: DropdownButtonProps(
          iconOpened: Icon(Icons.keyboard_arrow_down_sharp),
          iconClosed: Icon(Icons.keyboard_arrow_down_sharp),
          iconSize: ManagerIconsSizes.i20,
          color: context
              .theme.dropdownMenuTheme.inputDecorationTheme?.suffixIconColor,
        ),
      ),
      decoratorProps: DropDownDecoratorProps(
        baseStyle: context.theme.dropdownMenuTheme.textStyle,
        decoration: InputDecoration(
          hintText: hintText,
          helperText: ' ',
          errorBorder:
              context.theme.dropdownMenuTheme.inputDecorationTheme?.errorBorder,
          errorMaxLines: context
              .theme.dropdownMenuTheme.inputDecorationTheme?.errorMaxLines,
          fillColor:
              context.theme.dropdownMenuTheme.inputDecorationTheme?.fillColor,
          errorStyle:
              context.theme.dropdownMenuTheme.inputDecorationTheme?.errorStyle,
          contentPadding: context
              .theme.dropdownMenuTheme.inputDecorationTheme?.contentPadding,
          filled: context.theme.dropdownMenuTheme.inputDecorationTheme?.filled,
          hintStyle:
              context.theme.dropdownMenuTheme.inputDecorationTheme?.hintStyle,
          border: context.theme.dropdownMenuTheme.inputDecorationTheme?.border,
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        cacheItems: true,
        emptyBuilder: (context, _) => Center(
          child: Text(
            ManagerStrings.noResultFound,
            style: context.textTheme.displaySmall,
          ),
        ),
        loadingBuilder: (context, _) => Center(child: CustomLoading()),
        searchFieldProps: TextFieldProps(
          textInputAction: textInputAction,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: ManagerStrings.search,
            hintStyle: context.theme.inputDecorationTheme.hintStyle,
            border: context.theme.inputDecorationTheme.border,
            focusedBorder: context.theme.inputDecorationTheme.border,
            enabledBorder: context.theme.inputDecorationTheme.border,
          ),
          style: context.theme.inputDecorationTheme.hintStyle?.copyWith(
            color: context.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
