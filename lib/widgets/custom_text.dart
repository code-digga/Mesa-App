import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.size,
      this.weight,
      this.color,
      this.overflow,
      this.alignment});
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? overflow;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = PlatformTheme.of(context)?.isDark ?? false;
    return PlatformText(
      text,
      style: GoogleFonts.rubik(
        fontSize: size?.sp ?? 16.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? (isDarkMode ? Colors.white : Colors.black),
      ),
      textAlign: alignment ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
