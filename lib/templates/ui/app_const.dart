import 'package:flutter/material.dart';

class AppConst {
  // screen size
  static bool isB1200Screen(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;
  static bool isB1000Screen(BuildContext context) =>
      MediaQuery.of(context).size.width > 1000;
  static bool isB800Screen(BuildContext context) =>
      MediaQuery.of(context).size.width > 800;
  static bool isB600Screen(BuildContext context) =>
      MediaQuery.of(context).size.width > 600;

  // font
  static const interFont = 'inter';

  // icon
  static const chevronRight = 'assets/icons/Chevron.png';
  static const chevronDown = 'assets/icons/chevron-down.png';
  static const filterLines = 'assets/icons/filter-lines.png';
  static const heart = 'assets/icons/Heart.png';
  static const menu = 'assets/icons/menu-01.png';
  static const search = 'assets/icons/Search.png';

  // color
  static const grey = Color(0xFF535862);
  static const grey100 = Color(0xFFD5D7DA);
  static const grey200 = Color(0xFFF5F5F5);
  static const purple = Color(0xFF7F56D9);
}
