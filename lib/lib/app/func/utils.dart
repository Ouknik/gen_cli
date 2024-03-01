import 'package:farah_admin/app/constants/color.dart';
import 'package:flutter/material.dart';

class Utils {
  static TextStyle menuItemTextStyle(bool isSelected, fontSize) {
    return TextStyle(
        fontSize: fontSize,
        height: 1.3,
        color: isSelected ? Colors.grey[400] : AppColors.selectedMenuItemColor);
  }
}
