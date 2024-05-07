import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Light theme for android
final lightMaterialTheme = ThemeData(
  applyElevationOverlayColor: false,
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _errorColor,
        ),
        borderRadius: BorderRadius.circular(16).r),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _grey,
        ),
        borderRadius: BorderRadius.circular(16).r),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _darkGrey,
        ),
        borderRadius: BorderRadius.circular(16).r),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _errorColor,
        ),
        borderRadius: BorderRadius.circular(16).r),
  ),
  brightness: Brightness.light,
  cardColor: _secondaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: _mainColor),
  dialogBackgroundColor: _lightGrey,
  scaffoldBackgroundColor: _lightGrey,
);

// Dark theme configuration for android
final darkTheme = ThemeData(
    applyElevationOverlayColor: false,
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: _errorColor,
          ),
          borderRadius: BorderRadius.circular(16).r),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: _grey,
          ),
          borderRadius: BorderRadius.circular(16).r),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: _darkGrey,
          ),
          borderRadius: BorderRadius.circular(16).r),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: _errorColor,
          ),
          borderRadius: BorderRadius.circular(16).r),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: _textColor),
    brightness: Brightness.dark,
    cardColor: _secondaryColor,
    scaffoldBackgroundColor: _textColor);

// light theme configuration for iOS
const iosLightTheme = CupertinoThemeData(
    scaffoldBackgroundColor: _lightGrey,
    applyThemeToAll: true,
    primaryColor: _mainColor,
    brightness: Brightness.light,
    barBackgroundColor: Colors.transparent,
    primaryContrastingColor: _secondaryColor,
    textTheme: CupertinoTextThemeData());

// dark theme configuration for iOS
final iosDarkTheme = iosLightTheme.copyWith(
    scaffoldBackgroundColor: _textColor, brightness: Brightness.dark);

const _mainColor = Color(0xffE3562A);
const _secondaryColor = Color(0xff65AAEA);
const _errorColor = Color(0xffEF4949);
const _textColor = Color(0xff3C3A36);
const _darkGrey = Color(0xff78746D);
const _grey = Color(0xffBEBAB3);
const _lightGrey = Color(0xffF8F2EE);
