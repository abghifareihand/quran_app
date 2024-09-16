import 'package:flutter/material.dart';

class AppColor {
  // Light Theme Colors
  static const Color lightBgColor = Color(0xffFFFFFF);
  static const Color lightTitleColor = Color(0xff672CBC);
  static const Color lightPrimaryColor = Color(0xff994EF8);
  static const Color lightHeadlineColor = Color(0xff672CBC);
  static const Color lightTitleMediumColor = Color(0xff8789A3);
  // icon
  static const Color lightIconColor = Color(0xff8789A3);
  // nav
  static const Color lightNavbarColor = Color(0xffFFFFFF);
  static const Color lightIconNavActiveColor = Color(0xff672CBC);
  static const Color lightIconNavDisableColor = Color(0xff8789A3);

  // Dark Theme Colors
  static const Color darkBgColor = Color(0xff040C23);
  static const Color darkTitleColor = Color(0xffFFFFFF);
  static const Color darkPrimaryColor = Color(0xffA44AFF);
  static const Color darkHeadlineColor = Color(0xffFFFFFF);
  static const Color darkTitleMediumColor = Color(0xffA19CC5);
  // icon
  static const Color darkIconColor = Color(0xffA19CC5);
  // nav
  static const Color darkNavbarColor = Color(0xff121931);
  static const Color darkIconNavActiveColor = Color(0xffA44AFF);
  static const Color darkIconNavDisableColor = Color(0xffA19CC5);

  static Color getIconColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? lightIconColor : darkIconColor;
  }

  static Color getNavbarColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? lightNavbarColor : darkNavbarColor;
  }

  static Color getIconNavActive(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? lightIconNavActiveColor : darkIconNavActiveColor;
  }

  static Color getIconNavDisable(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? lightIconNavDisableColor : darkIconNavDisableColor;
  }

  static Color getSliverAppbarColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? lightBgColor : darkBgColor;
  }

  static Color getTabColorActive(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const Color(0xFF672CBC) : const Color(0xFFFFFFFF);
  }

  static Color getTabColorDisable(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const Color(0xFF8789A3) : const Color(0xFFA19CC5);
  }

  static Color getTabColorIndicator(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const Color(0xFF672CBC) : const Color(0xFF672CBC);
  }

  static Color getIconNumber(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const Color(0xFF863ED5) : const Color(0xFFA44AFF);
  }

  static Color getContainerAyat(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const Color(0xFF121931).withOpacity(0.05) : const Color(0xFF121931);
  }
}
