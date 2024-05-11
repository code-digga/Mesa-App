import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Platform Engineering',
              size: 18,
              weight: FontWeight.w600,
              alignment: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Center(
                child: Icon(
                  PlatformIcons(context).playArrow,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ),
            const CustomText(
              text: 'Introduction',
              size: 16,
              weight: FontWeight.w600,
              alignment: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomText(
              text:
                  'This is a brief introduction on Platform Engineering principles.',
              size: 14,
              weight: FontWeight.w400,
              alignment: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 30.h,
            ),
            const CustomText(
              text: 'Notes',
              size: 16,
              weight: FontWeight.w600,
              alignment: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomText(
              text:
                  'Ensure you complete watching this video. There will be an assignment given at the end of the video which must be submitted by the end of the week. All submissions are to made to my Email latest by COB on Friday.',
              size: 14,
              weight: FontWeight.w400,
              alignment: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ))),
      ),
    );
  }
}
