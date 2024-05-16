import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CourseTile extends StatelessWidget {
  const CourseTile(
      {super.key,
      required this.courseTitle,
      required this.courseCode,
      this.onTap});
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
