import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.btnHeight,
      this.btnWidth,
      required this.btnText,
      this.onTap,
      this.btnColor,
      this.btnTxtColor});
  final double? btnHeight, btnWidth;
  final String btnText;
  final void Function()? onTap;
  final Color? btnColor, btnTxtColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight?.h ?? 70.h,
      width: btnWidth?.w ?? 300.w,
      child: PlatformElevatedButton(
        color: btnColor,
        onPressed: onTap,
        child: CustomText(
          text: btnText,
          color: btnTxtColor ?? Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
