import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_button.dart';
import 'package:mesa_app/widgets/custom_input_field.dart';
import 'package:mesa_app/widgets/custom_text.dart';
import 'package:mesa_app/widgets/custom_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var showPassword = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SafeArea(
            child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(
                height: 45.h,
              ),
              SizedBox(
                height: 253.h,
                width: 343.w,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset('assets/images/login_image.png'),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const CustomText(
                text: 'Log in',
                size: 24,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 8.h,
              ),
              const CustomText(
                text: 'Log in with your school email and password.',
                size: 14,
                weight: FontWeight.normal,
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomInputField(
                          fieldHeight: 53,
                          hintText: 'Email',
                          fieldWidth: 343,
                          fieldController: emailController,
                          validateFunction: (value) => authValidator(value),
                          autoHints: const [AutofillHints.email]),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomInputField(
                          fieldHeight: 53,
                          hintText: 'Password',
                          fieldWidth: 343,
                          fieldController: passwordController,
                          iconBtnPress: () => togglePasswordVisibility(),
                          isSensitive: true,
                          validateFunction: (value) => authValidator(value),
                          hideText: !showPassword,
                          autoHints: const [AutofillHints.password]),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: CustomTextButton(
                  title: 'Forgot Password?',
                  onTap: () {},
                ),
              ),
              CustomButton(
                btnText: 'Log in',
                btnHeight: 56,
                btnWidth: 343,
                onTap: () async {
                  var formCorrect = formKey.currentState?.validate();
                  log('===========> form correct: $formCorrect');
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: CustomTextButton(
                  title: 'Sign up',
                  onTap: () {},
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  togglePasswordVisibility() => setState(() {
        showPassword = !showPassword;
      });

  String? authValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required';
    }
    return null;
  }
}
