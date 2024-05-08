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

  List<String> imagePaths = [
    'assets/images/onboarding_1.jpg',
    'assets/images/onboarding_2.jpg',
    'assets/images/onboarding_3.jpg',
  ];

  List<String> onboardingTitles = [
    'Find and register \n your courses',
    'Learn anytime \n and anywhere',
    'Take exams and assessments',
  ];

  List<String> onboardingSubTitles = [
    'Check out the courses you need \n to register for in the new semester.',
    'Watch the video lessons for \n all your registered courses on the go!',
    'Take your examinations and assessments \n conveniently.',
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
                  height: 70.h,
                ),
                SizedBox(
                  height: 450.h,
                  child: PageView(
                    reverse: false,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: imagePaths.map((path) {
                      var index = imagePaths.indexOf(path);
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 264.h,
                            width: 375.w,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.asset(path),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomText(
                            text: onboardingTitles[index],
                            size: 24,
                            weight: FontWeight.w600,
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomText(
                            text: onboardingSubTitles[index],
                            size: 14,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
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
                      onTap: () {
                        if (pageIndex < 2) {
                          pageController.animateToPage(pageIndex + 1,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                          pageIndex++;
                          setState(() {});
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
