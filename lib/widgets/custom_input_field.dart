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
      required this.isSensitive,
      required this.hideText,
      this.keyboard,
      this.validateFunction,
      required this.autoHints,
      this.hintText,
      required this.onChangeFunc,
      this.iconBtnPress});
  final TextEditingController fieldController;
  final double? fieldHeight, fieldWidth;
  final bool isSensitive, hideText;
  final TextInputType? keyboard;
  final String? Function(String?)? validateFunction;
  final Iterable<String> autoHints;
  final String? hintText;
  final void Function(String?) onChangeFunc;
  final void Function()? iconBtnPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth?.w ?? 300.w,
      height: fieldHeight?.h ?? 70.h,
      child: PlatformTextFormField(
        enableSuggestions: !isSensitive,
        autocorrect: !isSensitive,
        controller: fieldController,
        keyboardType: keyboard ?? TextInputType.text,
        obscureText: hideText,
        maxLines: null,
        minLines: null,
        onChanged: onChangeFunc,
        hintText: hintText,
        validator: validateFunction,
        autofillHints: autoHints,
        material: (_, __) => MaterialTextFormFieldData(
            decoration: InputDecoration(
          suffix: isSensitive
              ? PlatformIconButton(
                  onPressed: iconBtnPress,
                  materialIcon: hideText
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off))
              : null,
        )),
        cupertino: (context, platform) => CupertinoTextFormFieldData(
          prefix: isSensitive
              ? PlatformIconButton(
                  onPressed: iconBtnPress,
                  cupertinoIcon: hideText
                      ? const Icon(CupertinoIcons.eye)
                      : const Icon(CupertinoIcons.eye_slash))
              : null,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
