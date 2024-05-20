import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key});
  final startDate = DateTime(DateTime.now().year, DateTime.august, 3);
  final endDate = DateTime(DateTime.now().year + 1, DateTime.july, 26);
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'School calendar',
          size: 16,
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                text:
                    'Approved Academic Calendar for ${startDate.year}/${endDate.year} session',
                size: 22,
                weight: FontWeight.bold,
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                height: 20.h,
              ),
              const CustomText(
                text: 'First Semester (22 weeks)',
                size: 20,
              ),
              SizedBox(
                height: 20.h,
              ),
              const _CalendarDateRow(
                title: 'Resumption and Registration',
                period: '2',
              ),
              SizedBox(
                height: 15.h,
              ),
              const _CalendarDateRow(
                title: 'Lectures resume',
                period: '8',
              ),
              SizedBox(
                height: 15.h,
              ),
              const _CalendarDateRow(
                title: 'Test and Assessments',
                period: '2',
              ),
              SizedBox(
                height: 15.h,
              ),
              const _CalendarDateRow(
                title: 'Lectures continue',
                period: '8',
              ),
              SizedBox(
                height: 15.h,
              ),
              const _CalendarDateRow(
                title: 'Semester Examinations',
                period: '2',
              ),
              SizedBox(
                height: 30.h,
              ),
              const CustomText(
                text: 'Second Semester (22 weeks)',
                size: 20,
              ),
              SizedBox(
                height: 20.h,
              ),
              const _CalendarDateRow(
                title: 'Resumption and Registration',
                period: '2',
              ),
              SizedBox(
                height: 15.h,
              ),
              const _CalendarDateRow(
                title: 'Lectures resume',
                period: '8',
              ),
              SizedBox(
                height: 15.h,
              ),
              const _CalendarDateRow(
                title: 'Test and Assessments',
                period: '2',
              ),
              SizedBox(
                height: 15.h,
              ),
              const _CalendarDateRow(
                title: 'Lectures continue',
                period: '8',
              ),
              SizedBox(
                height: 15.h,
              ),
              const _CalendarDateRow(
                title: 'Semester Examinations',
                period: '2',
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class _CalendarDateRow extends StatelessWidget {
  const _CalendarDateRow({required this.title, required this.period});
  final String title, period;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200.w,
          child: CustomText(
            text: title,
            size: 16,
            weight: FontWeight.w400,
            alignment: TextAlign.start,
            overflow: TextOverflow.clip,
          ),
        ),
        SizedBox(
          width: 10.w,
          child: const CustomText(
            text: '-',
            size: 16,
            weight: FontWeight.w400,
            alignment: TextAlign.start,
            overflow: TextOverflow.clip,
          ),
        ),
        Expanded(
            child: CustomText(
          text: '$period weeks',
          size: 16,
          weight: FontWeight.w400,
          alignment: TextAlign.end,
          overflow: TextOverflow.clip,
        ))
      ],
    );
  }
}
