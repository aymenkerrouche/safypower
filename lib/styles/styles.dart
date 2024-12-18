import 'package:flutter/material.dart';

class Styles {
  static Color scaffoldBackgroundColor = const Color(0xFFe0efff);
  static Color defaultRedColor = const Color(0xffff698a);
  static Color defaultYellowColor = const Color(0xFFfedd69);
  static Color defaultBlueColor = const Color(0xff52beff);
  static Color defaultGreyColor = const Color(0xff77839a);
  static Color defaultLightGreyColor = const Color(0xffc4c4c4);
  static Color defaultLightWhiteColor = const Color.fromRGBO(242, 246, 254, 1);

  static double defaultPadding = 18.0;

  static BorderRadius defaultBorderRadius = BorderRadius.circular(20);

  static ScrollbarThemeData scrollbarTheme =
      const ScrollbarThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(defaultYellowColor),
    trackColor: MaterialStateProperty.all(const Color.fromRGBO(187, 187, 187, 1)),
    trackVisibility: const MaterialStatePropertyAll(true),
    thumbVisibility:  const MaterialStatePropertyAll(false),
    interactive: true,
    thickness: MaterialStateProperty.all(10.0),
    radius: const Radius.circular(20),
  );
}
