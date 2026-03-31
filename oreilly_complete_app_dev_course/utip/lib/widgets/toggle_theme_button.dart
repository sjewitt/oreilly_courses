import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/providers/theme_provider.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // VS Code is complaining that this cannot be const... 
    ThemeProvider providerOfThemeLocal = Provider.of<ThemeProvider>(context);
    return IconButton(
      iconSize: 40,
      onPressed: providerOfThemeLocal.toggleDarkMode,
      icon: providerOfThemeLocal.isDarkMode
          ? const Icon(Icons.nightlight_outlined)
          : const Icon(Icons.wb_sunny_outlined),
    );
  }
}