import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.title, this.textColor, this.onTap});
  final String title;
  final Color? textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      onPressed: onTap,
      child: CustomText(
        text: title,
        color: textColor,
      ),
    );
  }
}
