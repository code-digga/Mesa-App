import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/exam_tests/exams_page.dart';
import 'package:mesa_app/widgets/custom_button.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class ExamOnboardingPage extends StatefulWidget {
  const ExamOnboardingPage({super.key});

  @override
  State<ExamOnboardingPage> createState() => _ExamOnboardingPageState();
}

class _ExamOnboardingPageState extends State<ExamOnboardingPage> {
  bool boxChecked = false;
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const CustomText(
          text: 'Instructions',
          size: 16,
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text:
                    'Please read the following instructions carefully before you start.',
                size: 20,
                weight: FontWeight.bold,
                alignment: TextAlign.center,
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                height: 30.h,
              ),
              const _InstructionWidget(
                  number: '1.',
                  instruction:
                      'Before you begin, ensure you have good internet access and enough power on your device.'),
              SizedBox(
                height: 30.h,
              ),
              const _InstructionWidget(
                  number: '2.',
                  instruction:
                      'Answer all questions in one session. There will not be room to finish incomplete questions or start over again.'),
              SizedBox(
                height: 30.h,
              ),
              const _InstructionWidget(
                  number: '3.',
                  instruction:
                      'Upon submission, ensure you see the message confirming that your results have been submitted, otherwise you may have no record or score.'),
              SizedBox(
                height: 30.h,
              ),
              const _InstructionWidget(
                  number: '4.',
                  instruction:
                      'All tests will last for 2 mins while exams last for 5 mins. When the time is up, your answers will be automatically submitted. Good luck!'),
              SizedBox(
                height: 50.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlatformCheckbox(
                    value: boxChecked,
                    onChanged: (value) {
                      setState(() {
                        boxChecked = !boxChecked;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Expanded(
                    child: CustomText(
                      text:
                          'I have read and perfectly understood the above instructions.',
                      size: 16,
                      overflow: TextOverflow.clip,
                      alignment: TextAlign.start,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  btnText: 'Continue',
                  btnWidth: 300,
                  btnHeight: 50,
                  onTap: () {
                    if (boxChecked) {
                      Navigator.pushReplacement(
                          context,
                          platformPageRoute(
                            context: context,
                            builder: (context) => const ExamsPage(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: CustomText(
                        text: 'Please check the box',
                        color: Colors.white,
                        alignment: TextAlign.start,
                      )));
                    }
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class _InstructionWidget extends StatelessWidget {
  const _InstructionWidget({required this.number, required this.instruction});
  final String number, instruction;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: number,
          size: 18,
          alignment: TextAlign.start,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: CustomText(
            text: instruction,
            size: 18,
            alignment: TextAlign.start,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
