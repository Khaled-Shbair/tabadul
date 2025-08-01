import '/config/all_imports.dart';

class Validator {
  static String? phoneNumberValidator(String? phoneNumber) {
    if (phoneNumber == null ||
        !RegExp(r'^(059|056)[0-9]{7}$').hasMatch(phoneNumber)) {
      return ManagerStrings.pleaseEnterTheNumberCorrectly;
    }

    return null;
  }

  static String? descriptionOfProductValidator(String? description) {
    if (description == null || description.isEmpty || description.length < 30) {
      return ManagerStrings.pleaseEnterProductName;
    }

    return null;
  }

  static String? jobValidator(String? job) {
    if (job == null || job.isEmpty || job.length < 3) {
      return ManagerStrings.pleaseEnterJob;
    }

    return null;
  }

  static String? descriptionOfJobValidator(String? description) {
    if (description == null || description.isEmpty || description.length < 30) {
      return ManagerStrings.pleaseEnterDescriptionOfJob;
    }

    return null;
  }

  static String? priceValidator(String? price) {
    if (price == null || price.isEmpty || price == '0') {
      return ManagerStrings.pleaseEnterPriceOfProduct;
    }

    return null;
  }

  static String? productNameValidator(String? productName) {
    if (productName == null || productName.isEmpty) {
      return ManagerStrings.pleaseEnterProductName;
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
