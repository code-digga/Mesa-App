import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                height: 253.h,
                width: 343.w,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SvgPicture.asset('assets/images/login_image.svg'),
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
                size: 24,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                  child: Column(
                children: [
                  CustomInputField(
                      fieldHeight: 53,
                      fieldWidth: 343,
                      fieldController: emailController,
                      autoHints: const [AutofillHints.email]),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomInputField(
                      fieldHeight: 53,
                      fieldWidth: 343,
                      fieldController: emailController,
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
                onTap: () {},
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
}
