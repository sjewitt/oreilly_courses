import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  // getters
  bool get isDarkMode => _isDarkMode;

  // methods
  void _toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  bool _toggleDarkModeWithReturnVal() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    return _isDarkMode;
  }

  // he also provides a getter for the theme itself:
  ThemeData get currentTheme {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  void toggleDarkMode() {
    _toggleDarkMode();
  }

  toggleDarkModeWithReturnVal() {
    return _toggleDarkModeWithReturnVal();
  }

  ThemeProvider();
}
