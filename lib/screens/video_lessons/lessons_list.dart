import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/video_lessons/lesson_page.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class LessonsList extends StatefulWidget {
  const LessonsList({super.key});

  @override
  State<LessonsList> createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  var controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'Your Lessons',
          size: 16,
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h).r,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => showSearch(
                  context: context, delegate: CustomSearchDelegete()),
              child: Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10).r,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Icon(PlatformIcons(context).search),
                    SizedBox(
                      width: 10.w,
                    ),
                    const CustomText(
                      text: 'Search topics...',
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: ListView.separated(
              controller: controller,
              itemCount: 20,
              separatorBuilder: (context, index) => SizedBox(
                height: 30.h,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () => navigateNextPage(), child: const _LessonCard()),
            ))
          ],
        )),
      ),
    );
  }

  navigateNextPage() => Navigator.push(
      context,
      platformPageRoute(
        context: context,
        builder: (context) => const LessonsPage(),
      ));
}

class _LessonCard extends StatelessWidget {
  const _LessonCard();
  final List<Color> bgColors = const [Color(0xfffcbba7), Color(0xff93bee6)];
  @override
  Widget build(BuildContext context) {
    var showBlueBg = Random().nextInt(11) % 2 == 0;
    return Container(
      padding: const EdgeInsets.all(10).r,
      decoration: BoxDecoration(
          color: showBlueBg ? bgColors[1] : bgColors[0],
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16).r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: '14/04/22, 12PM',
            color: showBlueBg ? Colors.white : Colors.black,
            size: 14,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
            text: 'Python Programming',
            color: showBlueBg ? Colors.white : Colors.black,
            size: 16,
            weight: FontWeight.bold,
            overflow: TextOverflow.clip,
            alignment: TextAlign.start,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: 'An intro into programming with Python.',
            color: showBlueBg ? Colors.white : Colors.black,
            size: 16,
            weight: FontWeight.normal,
            overflow: TextOverflow.clip,
            alignment: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegete extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
