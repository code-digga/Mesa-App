import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Light theme for android
final lightMaterialTheme = ThemeData(
    applyElevationOverlayColor: false,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(GoogleFonts.rubik(
      color: _secondaryColor,
    )))),
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(iconSize: MaterialStatePropertyAll(25))),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10).h,
        isDense: false,
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: _errorColor,
            ),
            borderRadius: BorderRadius.circular(16).r),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: _grey,
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
          borderRadius: BorderRadius.circular(16).r,
        ),
        hintStyle: GoogleFonts.rubik(color: _darkGrey, fontSize: 16.sp)),
    // brightness: Brightness.light,
    cardColor: _secondaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: _mainColor),
    dialogBackgroundColor: _lightGrey,
    scaffoldBackgroundColor: _lightGrey,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(_mainColor),
            elevation: MaterialStatePropertyAll(0.h),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16).r)))));

// Dark theme configuration for android
final darkTheme = lightMaterialTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: _textColor),
    cardColor: _secondaryColor,
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: lightMaterialTheme.inputDecorationTheme.hintStyle
            ?.copyWith(color: _lightGrey)),
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
