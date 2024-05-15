import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class ViewResultsPage extends StatefulWidget {
  const ViewResultsPage({super.key});

  @override
  State<ViewResultsPage> createState() => _ViewResultsPageState();
}

class _ViewResultsPageState extends State<ViewResultsPage> {
  bool showTeacherView = false;
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'View Results',
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
              onPressed: () {
                setState(() {
                  showTeacherView = !showTeacherView;
                });
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SafeArea(
            child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: 'Available Results',
                size: 18,
              ),
            ),
            SizedBox(
              height: showTeacherView ? 15.h : 30.h,
            ),
            if (!showTeacherView)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    const _StudentScoreTile(title: 'Test', score: '39'),
                    SizedBox(
                      height: 30.h,
                    ),
                    const _StudentScoreTile(title: 'Exams', score: '51'),
                    SizedBox(
                      height: 30.h,
                    ),
                    const _StudentScoreTile(title: 'Total', score: '90'),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const _StudentScoreTile(
                        title: 'Grade',
                        score: 'A',
                      ),
                    )
                  ],
                ),
              ),
            if (showTeacherView)
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12).r,
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Column(
                        children: [
                          const _ResultTableEntry(
                            name: 'Name',
                            testScore: 'Test',
                            examScore: 'Exams',
                            totalScore: 'Total',
                            isHeader: true,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 10.h,
                          ),
                          Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) =>
                                      const _ResultTableEntry(
                                          name: 'Kamaldeen Ciroma Abdul',
                                          testScore: '25',
                                          examScore: '35',
                                          totalScore: '60'),
                                  separatorBuilder: (context, index) => Divider(
                                        color: Colors.grey.shade300,
                                        height: 10.h,
                                      ),
                                  itemCount: 50))
                        ],
                      )))
          ],
        )),
      ),
    );
  }
}

class _StudentScoreTile extends StatelessWidget {
  const _StudentScoreTile({required this.title, required this.score});
  final String title, score;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.w,
          child: CustomText(
            text: '$title: ',
            size: 22,
            weight: FontWeight.bold,
            alignment: TextAlign.start,
          ),
        ),
        SizedBox(
          width: 40.w,
        ),
        CustomText(
          text: score,
          size: 22,
          weight: FontWeight.bold,
          alignment: TextAlign.start,
        ),
      ],
    );
  }
}

class _ResultTableEntry extends StatelessWidget {
  const _ResultTableEntry(
      {required this.name,
      required this.testScore,
      required this.examScore,
      required this.totalScore,
      this.isHeader = false});
  final String name, testScore, examScore, totalScore;
  final bool isHeader;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: CustomText(
                  text: name,
                  size: isHeader ? 16 : 14,
                  weight: isHeader ? FontWeight.w500 : FontWeight.normal,
                  alignment: TextAlign.start,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            Expanded(
              child: CustomText(
                text: testScore,
                size: isHeader ? 16 : 14,
                weight: isHeader ? FontWeight.w500 : FontWeight.normal,
                alignment: TextAlign.center,
              ),
            ),
            Expanded(
              child: CustomText(
                text: examScore,
                size: isHeader ? 16 : 14,
                weight: isHeader ? FontWeight.w500 : FontWeight.normal,
                alignment: TextAlign.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: CustomText(
                  text: totalScore,
                  size: isHeader ? 16 : 14,
                  weight: isHeader ? FontWeight.w500 : FontWeight.normal,
                  alignment: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
