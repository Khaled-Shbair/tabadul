import '/config/all_imports.dart';

class Validator {
  static String? phoneNumberValidator(String? phoneNumber) {
    if (phoneNumber == null ||
        !RegExp(r'^(059|056)[0-9]{7}$').hasMatch(phoneNumber)) {
      return ManagerStrings.pleaseEnterTheNumberCorrectly;
    }

    return null;
  }

  static String? firstNameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return ManagerStrings.pleaseEnterFirstName;
    }

    return null;
  }

  static String? lastNameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return ManagerStrings.pleaseEnterLastName;
    }

    return null;
  }

  static String? dropdownSearchCity(String? choose) {
    if (choose == null || choose.isEmpty) {
      return ManagerStrings.pleaseSelectCity;
    }

    return null;
  }

  static String? dropdownSearchRegionStreet(String? choose) {
    if (choose == null || choose.isEmpty) {
      return ManagerStrings.pleaseSelectRegionStreet;
    }

    return null;
  }

  static bool securityCodeValidator(
    String? firstCode,
    String? secondCode,
    String? thirdCode,
    String? fourthCode,
    String? fifthCode,
    String? sixthCode,
  ) {
    if (firstCode == null &&
        secondCode == null &&
        thirdCode == null &&
        fourthCode == null &&
        fifthCode == null &&
        sixthCode == null) {
      return false;
    }
    return true;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Invalid Password';
    }
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(password)) {
      return 'Password must contain at least one special character.';
    }
    if (!RegExp(r'(?=.*\d)').hasMatch(password)) {
      return 'Password must contain at least one digit.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }
}
