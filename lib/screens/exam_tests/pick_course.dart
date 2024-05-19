import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/exam_tests/exams_onboarding.dart';
import 'package:mesa_app/widgets/courses_tile.dart';
import 'package:mesa_app/widgets/custom_button.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class PickCourse extends StatefulWidget {
  const PickCourse({super.key});

  @override
  State<PickCourse> createState() => _PickCourseState();
}

class _PickCourseState extends State<PickCourse> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: const CustomText(
            text: 'Pick course',
            size: 16,
            weight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16).r,
          child: SafeArea(
              child: ListView.separated(
                  itemBuilder: (context, index) => CourseTile(
                      onTap: () => determineType('PHY 223'),
                      courseTitle: 'Phyics of optoelectronic materials',
                      courseCode: 'PHY 223'),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 30.h,
                      ),
                  itemCount: 20)),
        ));
  }

  determineType(String courseCode) async {
    var type = await showPlatformModalSheet(
      context: context,
      material: MaterialModalSheetData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16).r,
      )),
      cupertino: CupertinoModalSheetData(),
      builder: (context) => const SelectExamType(),
    );
    if (type != null) {
      if (mounted) {
        Navigator.push(
            context,
            platformPageRoute(
              context: context,
              builder: (context) => ExamOnboardingPage(
                title: courseCode,
                isExam: type == 'exams',
              ),
            ));
      }
    }
  }
}

class SelectExamType extends StatefulWidget {
  const SelectExamType({super.key});

  @override
  State<SelectExamType> createState() => _SelectExamTypeState();
}

class _SelectExamTypeState extends State<SelectExamType> {
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16).r),
      padding: const EdgeInsets.all(14).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => setState(() {
              selectedType = 'tests';
            }),
            child: Container(
              padding: const EdgeInsets.all(16).r,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE3562A)),
                  borderRadius: BorderRadius.circular(12).r),
              child: Row(
                children: [
                  Radio(
                      value: 'tests',
                      groupValue: selectedType,
                      onChanged: (type) => setState(() {
                            selectedType = type;
                          })),
                  SizedBox(
                    width: 10.w,
                  ),
                  const CustomText(
                    text: 'Take tests',
                    size: 18,
                    alignment: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          InkWell(
            onTap: () => setState(() {
              selectedType = 'exams';
            }),
            child: Container(
                padding: const EdgeInsets.all(16).r,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffE3562A)),
                    borderRadius: BorderRadius.circular(12).r),
                child: Row(
                  children: [
                    Radio(
                        value: 'exams',
                        groupValue: selectedType,
                        onChanged: (type) => setState(() {
                              selectedType = type;
                            })),
                    SizedBox(
                      width: 10.w,
                    ),
                    const CustomText(
                      text: 'Take exams',
                      size: 18,
                      alignment: TextAlign.start,
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 30.h,
          ),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              btnText: 'Proceed',
              btnHeight: 50,
              btnWidth: 200,
              onTap: () => Navigator.pop(context, selectedType),
            ),
          )
        ],
      ),
    );
  }
}
