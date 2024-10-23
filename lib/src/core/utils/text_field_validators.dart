class TextFieldValidators {
  TextFieldValidators._();

  static const String requiredFieldMessage = "Please fill out this field.";

  static const invalidEmailAddressMessage =
      "Kindly enter a valid email address.";

  static const invalidInputMessage = "Invalid input.";

  static String? validateEmail(String? textFieldValue) {
    if (textFieldValue != null) {
      final emailRegex = RegExp("^\\S+@\\S+\\.\\S+\$");

      if (textFieldValue.trim().isEmpty) {
        return requiredFieldMessage;
      } else if (!emailRegex.hasMatch(textFieldValue.trim())) {
        return invalidEmailAddressMessage;
      }
    }
    return null;
  }

  static String? validateOTP(String? textFieldValue) {
    const int minOTPLength = 4;
    if (textFieldValue != null) {
      final numberRegex = RegExp(r'\d');
      if (textFieldValue.trim().isEmpty) {
        return requiredFieldMessage;
      } else if (!numberRegex.hasMatch(textFieldValue.trim()) ||
          int.tryParse(textFieldValue) == null ||
          textFieldValue.trim().length < minOTPLength) {
        return invalidInputMessage;
      }
    }
    return null;
  }

  static String? validateGenericField(String? fieldValue) {
    if (fieldValue != null) {
      if (fieldValue.trim().isEmpty) {
        return requiredFieldMessage;
      }
    }

    return null;
  }
}
