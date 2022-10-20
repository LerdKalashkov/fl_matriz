import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String number = '';

  bool isValidForm() {
    // ignore: avoid_print
    print(formKey.currentState?.validate());
    // ignore: avoid_print
    print(number);
    return formKey.currentState?.validate() ?? false;
  }
}
