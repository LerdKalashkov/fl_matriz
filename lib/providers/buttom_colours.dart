import 'package:flutter/material.dart';

class ButtomColoursProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Icon _icon = const Icon(Icons.error);
  Icon get icon => _icon;
  set icon(icon) {
    _icon = icon;
    notifyListeners();
  }

  Color _colour = Colors.grey;
  Color get colour => _colour;
  set colour(colour) {
    _colour = colour;
    notifyListeners();
  }

  change(index) {
    if (index != 1) {
      colour = Colors.deepPurple;
    } else {
      colour = Colors.green;
    }

    if (index != 1) {
      icon = const Icon(Icons.waves_rounded);
    } else {
      icon = const Icon(Icons.terrain_rounded);
    }
  }
}
