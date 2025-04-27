import '/config/all_imports.dart';

void selectCursorPosition(TextEditingController controller) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    int newPosition = controller.selection.baseOffset;
    if (newPosition != -1) {
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
  });
}
