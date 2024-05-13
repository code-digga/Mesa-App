import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_button.dart';

import '../../widgets/custom_text.dart';

class AddLessonPage extends StatefulWidget {
  const AddLessonPage({super.key});

  @override
  State<AddLessonPage> createState() => _AddLessonPageState();
}

class _AddLessonPageState extends State<AddLessonPage> {
  var topicController = TextEditingController();
  var introController = TextEditingController();
  var notesController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    topicController.dispose();
    introController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: const CustomText(
            text: 'Add Lesson',
            size: 16,
            weight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.h),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FieldWidget(
                  fieldTitle: 'Lesson Topic',
                  fieldController: topicController,
                  textBoxHeight: 80,
                  maxLength: 50,
                ),
                SizedBox(
                  height: 30.h,
                ),
                _FieldWidget(
                  fieldTitle: 'Brief Introduction',
                  fieldController: introController,
                  textBoxHeight: 80,
                  maxLength: 100,
                ),
                SizedBox(
                  height: 30.h,
                ),
                _FieldWidget(
                  fieldTitle: 'Notes to students',
                  fieldController: notesController,
                  textBoxHeight: 200,
                  maxLength: 200,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ActionBtn(
                        name: 'Upload File',
                        img: const Icon(
                          Icons.file_upload_sharp,
                          size: 40,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      width: 40.w,
                    ),
                    _ActionBtn(
                        name: 'Record Video',
                        img: const Icon(
                          Icons.video_collection,
                          size: 40,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 150.h,
                    width: 250.w,
                    padding: const EdgeInsets.all(10).r,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16).r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: 'recording_lesson.mp4',
                          size: 14,
                          alignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomButton(
                          btnText: 'Cancel',
                          onTap: () {},
                          btnHeight: 30,
                          btnWidth: 150,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    btnText: 'Proceed',
                    btnHeight: 50,
                  ),
                )
              ],
            ),
          )),
        ));
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

class _ActionBtn extends StatelessWidget {
  const _ActionBtn(
      {required this.name, required this.img, required this.onPressed});
  final String name;
  final Widget img;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50.w,
            height: 50.h,
            child: FittedBox(
              child: img,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: name,
            size: 16,
          )
        ],
      ),
    );
  }
}
