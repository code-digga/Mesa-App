import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/courses/student_course_register.dart';
import 'package:mesa_app/screens/courses/teacher_course_register.dart';
import 'package:mesa_app/widgets/custom_button.dart';

import '../../widgets/custom_text.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({super.key});

  @override
  State<AllCourses> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'Your courses',
          weight: FontWeight.bold,
          size: 16,
        ),
        trailingActions: [
          Padding(
            padding: const EdgeInsets.only(right: 16).r,
            child: PlatformIconButton(
              icon: Icon(
                PlatformIcons(context).addCircled,
                color: const Color(0xffE3562A),
                size: 35,
              ),
              onPressed: () => Navigator.push(
                  context,
                  platformPageRoute(
                    context: context,
                    builder: (context) => const TeacherCourseRegistration(),
                  )),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: 700.h,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                width: double.infinity.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _CourseTile(
                        isTitleRow: true,
                        code: 'Course Code',
                        title: 'Course Title',
                        units: 'Units'),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 10.h,
                    ),
                    ...List.generate(10, (index) {
                      bool isLast = index == 9;
                      return Column(
                        children: [
                          const _CourseTile(
                              code: 'FST 121',
                              title: 'Food poisoining and prevention',
                              units: '3'),
                          if (!isLast)
                            Divider(
                              color: Colors.grey.shade300,
                              height: 10.h,
                            ),
                        ],
                      );
                    })
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                btnText: 'Start Registration',
                btnWidth: 200,
                btnHeight: 50,
                onTap: () {
                  Navigator.push(
                      context,
                      platformPageRoute(
                        context: context,
                        builder: (context) => const StudentRegisterCourse(),
                      ));
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}

class _CourseTile extends StatelessWidget {
  const _CourseTile(
      {required this.code,
      required this.title,
      required this.units,
      this.isTitleRow = false});
  final String code, title, units;
  final bool isTitleRow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: SizedBox(
            width: 100.w,
            height: 50.h,
            child: CustomText(
              text: code,
              alignment: TextAlign.start,
              overflow: TextOverflow.clip,
              size: 16,
              weight: isTitleRow ? FontWeight.w600 : null,
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: SizedBox(
            height: 50.h,
            child: CustomText(
              text: title,
              alignment: TextAlign.start,
              overflow: TextOverflow.clip,
              size: 16,
              weight: isTitleRow ? FontWeight.w600 : null,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: SizedBox(
            width: 100.w,
            height: 50.h,
            child: CustomText(
              text: units,
              alignment: TextAlign.center,
              overflow: TextOverflow.clip,
              size: 16,
              weight: isTitleRow ? FontWeight.w600 : null,
            ),
          ),
        ),
      ],
    );
  }
}
