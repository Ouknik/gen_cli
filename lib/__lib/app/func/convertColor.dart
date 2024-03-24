import 'package:flutter/material.dart';

Color getColorFromHex(String hex) {
  if (hex.contains('#')) {
    return Color(int.parse(hex.replaceAll("#", "0xFF")));
  } else {
    return Color(int.parse("0xFF" + hex));
  }
}
