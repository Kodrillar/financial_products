import 'package:flutter/services.dart';

typedef ListOfInputFormatter = List<TextInputFormatter>;

class TextFieldInputFormatters {
  TextFieldInputFormatters._();

  static ListOfInputFormatter numberInputFormatter = [
    FilteringTextInputFormatter.digitsOnly,
  ];
}
