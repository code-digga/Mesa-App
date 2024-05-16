import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/results/view_results_page.dart';
import 'package:mesa_app/widgets/custom_text.dart';

import '../../widgets/courses_tile.dart';

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
                itemBuilder: (context, index) => CourseTile(
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
