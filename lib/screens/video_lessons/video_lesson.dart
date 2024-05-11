import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/video_lessons/lessons_list.dart';
import 'package:mesa_app/widgets/custom_text.dart';
import 'package:mesa_app/widgets/empty_data_view.dart';

class VideoLessons extends StatefulWidget {
  const VideoLessons({super.key});

  @override
  State<VideoLessons> createState() => _VideoLessonsState();
}

class _VideoLessonsState extends State<VideoLessons> {
  final List<String> courses = const [
    'CPE 211',
    'CPE 211',
    'CPE 211',
    'CPE 211',
    'CPE 211',
    'CPE 211',
    'CPE 211',
    'CPE 211',
    'CPE 211',
    'CPE 211',
  ];

  final List<String> codes = const [
    'Computer Engineering Principles',
    'Computer Engineering Principles',
    'Computer Engineering Principles',
    'Computer Engineering Principles',
    'Computer Engineering Principles',
    'Computer Engineering Principles',
    'Computer Engineering Principles',
    'Computer Engineering Principles',
    'Computer Engineering Principles',
    'Computer Engineering Principles',
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'Your courses',
          size: 16,
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h).r,
        child: SafeArea(
            child: courses.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Select a course',
                        size: 18,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                          child: PlatformWidgetBuilder(
                        material: (_, child, __) {
                          return ListView(
                            children: List.generate(
                                courses.length,
                                (index) => Container(
                                      padding: const EdgeInsets.all(10).r,
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(16).r),
                                      child: PlatformListTile(
                                        onTap: () => navigateToLesson(),
                                        trailing: Icon(
                                          PlatformIcons(context).forward,
                                        ),
                                        subtitle: CustomText(
                                          text: codes[index],
                                          size: 14,
                                          alignment: TextAlign.start,
                                        ),
                                        title: CustomText(
                                          text: courses[index],
                                          alignment: TextAlign.start,
                                          size: 16,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                          );
                        },
                        cupertino: (_, child, __) => CupertinoListSection(
                          hasLeading: false,
                          separatorColor: Colors.grey,
                          children: List.generate(
                              courses.length,
                              (index) => PlatformListTile(
                                    onTap: () => navigateToLesson(),
                                    trailing: Icon(
                                      PlatformIcons(context).forward,
                                    ),
                                    subtitle: CustomText(
                                      text: codes[index],
                                      size: 14,
                                    ),
                                    title: CustomText(
                                      text: courses[index],
                                      size: 16,
                                      weight: FontWeight.bold,
                                    ),
                                  )),
                        ),
                      ))
                    ],
                  )
                : const EmptyData(
                    msg: 'No registered courses found.',
                  )),
      ),
    );
  }

  navigateToLesson() => Navigator.push(
      context,
      platformPageRoute(
        context: context,
        builder: (context) => const LessonsList(),
      ));
}
