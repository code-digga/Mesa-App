import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class ExamsPage extends StatefulWidget {
  const ExamsPage({super.key});

  @override
  State<ExamsPage> createState() => _ExamsPageState();
}

class _ExamsPageState extends State<ExamsPage> {
  DateTime timeStarted = DateTime(2024, 1, 1, 1, 20, 0);
  DateTime duration = DateTime(2024, 1, 1, 1, 20, 0);
  bool examFinished = false;
  late Timer examTimer;
  @override
  void initState() {
    super.initState();
    examTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration.subtract(const Duration(seconds: 1));
      if (timeStarted.difference(duration).inSeconds == 120) {
        examFinished = true;
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    examTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: PlatformScaffold(
        appBar: PlatformAppBar(
          title: const CustomText(
            text: 'PHY 123 Tests',
            size: 16,
            weight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16).r,
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: '${duration.minute} : ${duration.second}',
                    size: 22,
                    weight: FontWeight.bold,
                    color: const Color(0xffE3562A),
                  )),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                  child: ListView.separated(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context, index) => QuestionAndAnswerTile(
                          hasOptions: true,
                          question:
                              'What is the name of the first man on the moon?',
                          optionsOrKeywords: const [
                            'Neil Armstrung',
                            'Neel Armstrong',
                            'Neil Armstrong',
                            'Niel Armstrong'
                          ],
                          questionNumber: '${index + 1}',
                          callback: (val) =>
                              log('Seleced option $val for Index $index')),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 30.h,
                          ),
                      itemCount: 20))
            ],
          )),
        ),
      ),
    );
  }
}

class QuestionAndAnswerTile extends StatefulWidget {
  const QuestionAndAnswerTile(
      {super.key,
      required this.hasOptions,
      required this.question,
      required this.optionsOrKeywords,
      required this.questionNumber,
      required this.callback});
  final bool hasOptions;
  final String question, questionNumber;
  final List<String> optionsOrKeywords;
  final void Function(String) callback;

  @override
  State<QuestionAndAnswerTile> createState() => _QuestionAndAnwerTileState();
}

class _QuestionAndAnwerTileState extends State<QuestionAndAnswerTile> {
  int? selectedOption;
  var answerBoxController = TextEditingController();

  @override
  void dispose() {
    answerBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: widget.questionNumber,
              size: 18,
              alignment: TextAlign.start,
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: CustomText(
                text: widget.question,
                size: 18,
                alignment: TextAlign.start,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        ...List.generate(
            widget.optionsOrKeywords.length,
            (index) => Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: SizedBox(
                    width: 300.w,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ChoiceChip(
                          onSelected: (_) {
                            setState(() {
                              selectedOption = index;
                            });
                            widget.callback(index.toString());
                          },
                          label: CustomText(
                            text: widget.optionsOrKeywords[index],
                            size: 18,
                            alignment: TextAlign.start,
                            overflow: TextOverflow.clip,
                          ),
                          selected: selectedOption == index),
                    ),
                  ),
                )),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 100.h,
          width: 300.w,
          child: Padding(
            padding: const EdgeInsets.all(10.0).r,
            child: PlatformTextFormField(
              controller: answerBoxController,
              expands: true,
              maxLines: null,
              minLines: null,
              onFieldSubmitted: (value) => widget.callback(value),
            ),
          ),
        )
      ],
    );
  }
}
