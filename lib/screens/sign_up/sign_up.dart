import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/home_page/home_page.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var fullNameCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var showPassword = false;

  var userType = 'Teacher';
  var userTypes = ['Teacher', 'Student'];

  @override
  void dispose() {
    fullNameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).r,
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
                  child: Image.asset('assets/images/signup_image.png'),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const CustomText(
                text: 'Sign up',
                size: 24,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: const CustomText(
                  text: 'Sign up using your official names and school mail.',
                  size: 14,
                  weight: FontWeight.normal,
                  overflow: TextOverflow.clip,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: 'I am a:',
                            size: 16,
                            weight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 0.h),
                            width: 200.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16).r,
                                border: Border.all(color: Colors.grey)),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    value: userType,
                                    decoration: const InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    validator: (value) => authValidator(value),
                                    items: userTypes
                                        .map((type) => DropdownMenuItem<String>(
                                            value: type,
                                            child: CustomText(text: type)))
                                        .toList(),
                                    onChanged: (newType) {
                                      userType = newType ?? 'Teacher';
                                      setState(() {});
                                    })),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomInputField(
                          hintText: 'Full name',
                          fieldWidth: 343,
                          fieldController: fullNameCtrl,
                          validateFunction: (value) => authValidator(value),
                          autoHints: const [
                            AutofillHints.familyName,
                            AutofillHints.name
                          ]),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomInputField(
                          hintText: 'E-mail',
                          fieldWidth: 343,
                          fieldController: emailCtrl,
                          validateFunction: (value) => authValidator(value),
                          autoHints: const [AutofillHints.email]),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomInputField(
                          hintText: 'Password',
                          fieldWidth: 343,
                          fieldController: passwordCtrl,
                          iconBtnPress: () => togglePasswordVisibility(),
                          isSensitive: true,
                          validateFunction: (value) => authValidator(value),
                          hideText: !showPassword,
                          autoHints: const [AutofillHints.password]),
                    ],
                  )),
              CustomButton(
                btnText: 'Sign up',
                btnHeight: 56,
                btnWidth: 343,
                onTap: () async {
                  // var formCorrect = formKey.currentState?.validate();
                  Navigator.pushAndRemoveUntil(
                      context,
                      platformPageRoute(
                        context: context,
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false);
                },
              ),
              CustomTextButton(
                title: 'Log in',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )),
      ),
    );
  }

  String? authValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required';
    }
    return null;
  }

  togglePasswordVisibility() => setState(() {
        showPassword = !showPassword;
      });
}
