import 'package:flutter/material.dart';

final _customColor = Color(0xFF49149F);

final List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
  : assert (selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, 
  'Colors must be between 0 and ${ _colorThemes.length }');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
