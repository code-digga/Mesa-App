import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_button.dart';
import 'package:mesa_app/widgets/custom_text.dart';
import 'package:mesa_app/widgets/custom_text_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var pageController = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      pageController.animateToPage(pageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      pageIndex++;
      // if (pageIndex < 2) {
      //   pageController.animateToPage(pageIndex + 1,
      //       duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      //   pageIndex++;
      // } else {
      //   pageController.animateToPage(0,
      //       duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      //   pageIndex = 0;
      // }
      setState(() {});
    });
  }

  List<String> imagePaths = [
    'assets/images/onboarding_1.jpg',
    'assets/images/onboarding_2.jpg',
    'assets/images/onboarding_3.jpg',
  ];

  List<String> onboardingTitles = [
    'assets/images/onboarding_1.jpg',
    'assets/images/onboarding_2.jpg',
    'assets/images/onboarding_3.jpg',
  ];

  List<String> onboardingSubTitles = [
    'assets/images/onboarding_1.jpg',
    'assets/images/onboarding_2.jpg',
    'assets/images/onboarding_3.jpg',
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).r,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    title: 'Skip',
                    onTap: () => log('==================> we good'),
                  ),
                ),
                SizedBox(
                  height: 112.h,
                ),
                SizedBox(
                  height: 264.h,
                  width: 375.w,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('assets/images/onboarding_1.jpg'),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CustomText(
                  text: 'Learn anytime \n and anywhere',
                  size: 24,
                  weight: FontWeight.w600,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 8.h,
                ),
                const CustomText(
                  text:
                      'Quarantine is the perfect time to spend your \n day learning something new, from anywhere!',
                  size: 14,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    var isCurrentPage = pageIndex == index;
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                          shape: isCurrentPage
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                          color: isCurrentPage ? Colors.blue : Colors.grey,
                          borderRadius: isCurrentPage
                              ? BorderRadius.circular(4).r
                              : null),
                      height: 6.h,
                      width: isCurrentPage ? 16.w : 6.w,
                    );
                  }),
                ),
                SizedBox(
                  height: 72.h,
                ),
                SizedBox(
                    height: 56.h,
                    width: 311.w,
                    child: CustomButton(
                      btnText: 'Next',
                      onTap: () => log('go to next page'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
