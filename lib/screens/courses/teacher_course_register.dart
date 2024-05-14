import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_button.dart';

import '../../widgets/custom_text.dart';

class TeacherCourseRegistration extends StatefulWidget {
  const TeacherCourseRegistration({super.key});

  @override
  State<TeacherCourseRegistration> createState() =>
      _TeacherCourseRegistrationState();
}

class _TeacherCourseRegistrationState extends State<TeacherCourseRegistration> {
  var courseCodeController = TextEditingController();
  var courseTitleController = TextEditingController();
  String courseUnits = '1';
  List<String> allowedUnits = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];

  @override
  void dispose() {
    courseCodeController.dispose();
    courseTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'Register course',
          weight: FontWeight.bold,
          size: 16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FieldWidget(
                  fieldTitle: 'Course Title',
                  fieldController: courseTitleController,
                  textBoxHeight: 80,
                  maxLength: 30),
              SizedBox(
                height: 35.h,
              ),
              _FieldWidget(
                  fieldTitle: 'Course Code',
                  fieldController: courseCodeController,
                  textBoxHeight: 80,
                  maxLength: 7),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  const CustomText(
                    text: 'Course Units: ',
                    size: 16,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                            value: courseUnits,
                            onChanged: (option) {
                              setState(() {
                                courseUnits = option ?? '1';
                              });
                            },
                            items: allowedUnits
                                .map((unit) => DropdownMenuItem<String>(
                                    value: unit,
                                    child: CustomText(
                                      text: unit,
                                      size: 18,
                                    )))
                                .toList())),
                  )
                ],
              ),
              SizedBox(
                height: 70.h,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  btnText: 'Add Course',
                  btnWidth: 200,
                  btnHeight: 50,
                  onTap: () {},
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class _FieldWidget extends StatelessWidget {
  const _FieldWidget(
      {required this.fieldTitle,
      required this.fieldController,
      required this.textBoxHeight,
      required this.maxLength});
  final String fieldTitle;
  final TextEditingController fieldController;
  final double textBoxHeight;
  final int maxLength;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: fieldTitle,
            size: 16,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: textBoxHeight.h,
            width: 350.w,
            child: PlatformTextFormField(
              keyboardType: TextInputType.text,
              maxLines: null,
              minLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              textAlign: TextAlign.start,
              maxLength: maxLength,
              controller: fieldController,
              material: (_, __) => MaterialTextFormFieldData(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10).r)),
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return '*Required';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
