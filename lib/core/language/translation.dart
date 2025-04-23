import '../../config/all_imports.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LocaleConstants.ar: ar,
        LocaleConstants.en: en,
      };
}
