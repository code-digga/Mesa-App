import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/results/view_results_page.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class ResultSelectCourse extends StatefulWidget {
  const ResultSelectCourse({super.key});

  @override
  State<ResultSelectCourse> createState() => _ResultSelectCourseState();
}

class _ResultSelectCourseState extends State<ResultSelectCourse> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'Select Course',
          weight: FontWeight.bold,
          size: 16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SafeArea(
            child: ListView.separated(
                itemBuilder: (context, index) => _CourseTile(
                    onTap: () => Navigator.push(
                        context,
                        platformPageRoute(
                            context: context,
                            builder: (context) => const ViewResultsPage())),
                    courseTitle: 'Digital and Analog Circuits II',
                    courseCode: 'EEE311'),
                separatorBuilder: (context, index) => SizedBox(
                      height: 30.h,
                    ),
                itemCount: 20)),
      ),
    );
  }
}

class _CourseTile extends StatelessWidget {
  const _CourseTile(
      {required this.courseTitle, required this.courseCode, this.onTap});
  final String courseTitle, courseCode;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      padding: const EdgeInsets.all(10).r,
      decoration: BoxDecoration(
          color: const Color(0xff65AAEA),
          borderRadius: BorderRadius.circular(16).r,
          border: Border.all(color: Colors.grey.shade300)),
      child: PlatformListTile(
        onTap: onTap,
        title: CustomText(
          text: courseCode,
          size: 16,
          weight: FontWeight.w500,
          alignment: TextAlign.start,
          color: Colors.white,
        ),
        subtitle: CustomText(
          text: courseTitle,
          size: 14,
          alignment: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          color: Colors.white,
        ),
      ),
    );
  }
}
