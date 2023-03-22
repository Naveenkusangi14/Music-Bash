import 'package:flutter/material.dart';

class RandomColors {
  static const colors = [
    Colors.pink,
    Color.fromARGB(255, 194, 152, 1),
    Color.fromARGB(255, 249, 64, 255),
    Color.fromARGB(255, 0, 20, 153),
    Colors.indigo,


  ];
}


class ColorConstants {
  static Color starterWhite = hexToColor('#DADADA');
  static Color primaryColor = hexToColor('#1ED760');
  static Color cardBackGroundColor = hexToColor('#0E0E0F');
  static Color inputHintColor = hexToColor('#FFFFFF');

}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}