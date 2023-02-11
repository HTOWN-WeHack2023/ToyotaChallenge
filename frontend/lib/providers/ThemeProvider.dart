// ignore_for_file: file_names
import 'package:flutter/foundation.dart';

enum CustomTheme {
  dark,
  light,
  cool,
  astros,
}

class ThemeProviderNotifier extends ChangeNotifier {
  CustomTheme appTheme = CustomTheme.light;

  getTheme() => appTheme;

  void changeTheme(CustomTheme _theme) {
    appTheme = _theme;
    notifyListeners();
  }
}
