import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.fieldController,
      this.fieldHeight,
      this.fieldWidth,
      this.isSensitive,
      this.hideText,
      this.keyboard,
      this.validateFunction,
      this.autoHints,
      this.hintText,
      this.onChangeFunc,
      this.iconBtnPress});
  final TextEditingController fieldController;
  final double? fieldHeight, fieldWidth;
  final bool? isSensitive, hideText;
  final TextInputType? keyboard;
  final String? Function(String?)? validateFunction;
  final Iterable<String>? autoHints;
  final String? hintText;
  final void Function(String?)? onChangeFunc;
  final void Function()? iconBtnPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth?.w ?? 300.w,
      height: fieldHeight?.h ?? 70.h,
      child: PlatformTextFormField(
        controller: fieldController,
        keyboardType: keyboard ?? TextInputType.text,
        obscureText: hideText,
        maxLines: isSensitive == null || isSensitive == false ? null : 1,
        minLines: null,
        onChanged: onChangeFunc,
        hintText: hintText,
        // expands: isSensitive == null || isSensitive == false,
        validator: validateFunction,
        autofillHints: autoHints,
        material: (_, __) => MaterialTextFormFieldData(
            decoration: InputDecoration(
          suffixIcon: isSensitive ?? false
              ? PlatformIconButton(
                  onPressed: iconBtnPress,
                  materialIcon: hideText ?? false
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off))
              : null,
        )),
        cupertino: (context, platform) => CupertinoTextFormFieldData(
          prefix: isSensitive ?? false
              ? PlatformIconButton(
                  onPressed: iconBtnPress,
                  cupertinoIcon: hideText ?? false
                      ? const Icon(CupertinoIcons.eye)
                      : const Icon(CupertinoIcons.eye_slash))
              : null,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
