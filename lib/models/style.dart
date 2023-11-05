import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF737373);
Color kSecondaryDarkColor = const Color(0xFF222222);
Color kSecondaryLightColor = const Color(0xFFD9D9D9);
Color kBackgroundDarkColor = const Color(0xFF0D0D0D);
Color kBackgroundLightColor = const Color(0xFFF2F2F2);

TextStyle kNormalStyle = TextStyle(
  color: kBackgroundLightColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle kHeaddingStyle = TextStyle(
  color: kBackgroundLightColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

TextStyle kNormalStyleDark = TextStyle(
  color: kSecondaryDarkColor,
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

TextStyle kHeaddingStyleDark = TextStyle(
  color: kSecondaryDarkColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

TextStyle kSubStyle = TextStyle(
  color: kBackgroundLightColor.withOpacity(0.7),
  fontSize: 12,
  fontWeight: FontWeight.normal,
);
