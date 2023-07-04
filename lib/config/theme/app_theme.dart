import 'package:flutter/material.dart';

const Color _customColor = Color(0x008606B4);

final List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.yellow,
  Colors.teal,
  Colors.orange,
  Colors.red,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length,
            'colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
          useMaterial3: true, 
          colorSchemeSeed: _colorThemes[selectedColor],
        );
  }
}
