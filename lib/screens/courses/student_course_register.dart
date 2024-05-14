import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_button.dart';

import '../../widgets/custom_text.dart';

class StudentRegisterCourse extends StatefulWidget {
  const StudentRegisterCourse({super.key});

  @override
  State<StudentRegisterCourse> createState() => _StudentRegisterCourseState();
}

class _StudentRegisterCourseState extends State<StudentRegisterCourse> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'Register courses',
          weight: FontWeight.bold,
          size: 16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => showSearch(
                  context: context, delegate: CustomSearchDelegate()),
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
                      text: 'Search courses...',
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
                    itemBuilder: (context, index) => const _CourseTile(
                        code: 'FST 121',
                        title: 'Food Engineering and Science 2',
                        units: 2),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 30.h,
                        ),
                    itemCount: 20)),
            SizedBox(
              height: 20.h,
            ),
            const Align(
              alignment: Alignment.center,
              child: Badge(
                backgroundColor: Color(0xff65AAEA),
                label: CustomText(
                  color: Colors.white,
                  text: '5',
                  weight: FontWeight.bold,
                  size: 14,
                ),
                child: CustomButton(
                  btnText: 'Proceed',
                  btnWidth: 200,
                  btnHeight: 50,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class _CourseTile extends StatefulWidget {
  const _CourseTile(
      {required this.code, required this.title, required this.units});
  final String code, title;
  final int units;

  @override
  State<_CourseTile> createState() => _CourseTileState();
}

class _CourseTileState extends State<_CourseTile> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12).r),
      child: PlatformListTile(
        onTap: () => setState(() {
          selected = !selected;
        }),
        subtitle: CustomText(
          text: widget.title,
          size: 14,
          weight: FontWeight.w400,
          alignment: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ),
        title: CustomText(
          text: widget.code,
          size: 18,
          weight: FontWeight.w600,
          alignment: TextAlign.start,
        ),
        leading: Checkbox(value: selected, onChanged: (newValue) {}),
        trailing: CustomText(
          text: '${widget.units} ${widget.units > 1 ? 'Units' : 'Unit'}',
          size: 14,
          weight: FontWeight.w400,
          alignment: TextAlign.end,
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      PlatformIconButton(
        icon: const Icon(Icons.close),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return PlatformIconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10).r,
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => SizedBox(
          height: 30.h,
        ),
        itemBuilder: (context, index) => const _CourseTile(
          code: 'FST 321',
          units: 1,
          title: 'History of Food Preservations.',
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10).r,
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => SizedBox(
          height: 30.h,
        ),
        itemBuilder: (context, index) => const _CourseTile(
          code: 'FST 321',
          units: 1,
          title: 'History of Food Preservations.',
        ),
      ),
    );
  }
}
