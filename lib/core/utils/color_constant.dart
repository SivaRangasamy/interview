import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#ac816e');

  static Color gray60001 = fromHex('#787f89');

  static Color blueGray50 = fromHex('#e8eef0');

  static Color blue800 = fromHex('#1a62c6');

  static Color blueGray500 = fromHex('#75808a');

  static Color lightBlue600 = fromHex('#0cabdf');

  static Color lightBlue60019 = fromHex('#190cabdf');

  static Color gray100 = fromHex('#f7f7f7');

  static Color blueGray50001 = fromHex('#76808a');

  static Color black900 = fromHex('#000000');

  static Color gray10001 = fromHex('#f4f4f4');

  static Color lightBlue6003f = fromHex('#3f0cabdf');

  static Color blue100 = fromHex('#c6ebf6');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
