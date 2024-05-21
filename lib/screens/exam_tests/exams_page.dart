import 'dart:async';
import 'dart:developer' as dd;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_button.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class ExamsPage extends StatefulWidget {
  const ExamsPage(
      {super.key, required this.isExams, required this.courseTitle});
  final bool isExams;
  final String courseTitle;

  @override
  State<ExamsPage> createState() => _ExamsPageState();
}

class _ExamsPageState extends State<ExamsPage> {
  late ValueNotifier<int> clockMin;
  late int numberOfQuestions;
  ValueNotifier<int> clockSecond = ValueNotifier(59);
  bool examFinished = false;
  late Timer examTimer;
  Map<String, String> answers = {};
  @override
  void initState() {
    super.initState();
    clockMin = ValueNotifier(widget.isExams ? 4 : 1);
    numberOfQuestions = widget.isExams ? 20 : 10;
    startTimer();
  }

  startTimer() async {
    await Future.delayed(const Duration(seconds: 2));
    examTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      clockSecond.value--;
      if (clockSecond.value == 0) {
        if (clockMin.value == 0) {
          examFinished = true;
          timer.cancel();
          return;
        }
        clockMin.value--;
        clockSecond.value = 59;
      }
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
          title: CustomText(
            text: '${widget.courseTitle} ${widget.isExams ? 'Exams' : 'Tests'}',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: clockMin,
                    builder: (_, value, __) => CustomText(
                      text: '0$value :',
                      size: 24,
                      weight: FontWeight.bold,
                      color: const Color(0xffE3562A),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: clockSecond,
                    builder: (_, value, __) => CustomText(
                      text: ' ${value < 10 ? '0$value' : value}',
                      size: 24,
                      weight: FontWeight.bold,
                      color: const Color(0xffE3562A),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  Expanded(
                      child: CustomButton(
                    btnText: 'Submit',
                    btnHeight: 50,
                    btnWidth: 200,
                    onTap: () {},
                  ))
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                  child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.manual,
                children: [
                  ...List.generate(
                      numberOfQuestions,
                      (index) => Column(
                            children: [
                              QuestionAndAnswerTile(
                                  answer: answers.containsKey(index.toString())
                                      ? answers[index.toString()] ?? ''
                                      : '',
                                  hasOptions: Random().nextBool(),
                                  question:
                                      'What is the name of the first man on the moon?',
                                  optionsOrKeywords: const [
                                    'Neil Armstrung',
                                    'Neel Armstrong',
                                    'Neil Armstrong',
                                    'Niel Armstrong'
                                  ],
                                  questionNumber: '${index + 1}',
                                  callback: (val) {
                                    answers[index.toString()] = val;
                                    dd.log(answers.toString());
                                  }),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ))
                ],
              ))
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
      required this.callback,
      required this.answer});
  final bool hasOptions;
  final String question, questionNumber, answer;
  final List<String> optionsOrKeywords;
  final void Function(String) callback;

  @override
  State<QuestionAndAnswerTile> createState() => _QuestionAndAnwerTileState();
}

class _QuestionAndAnwerTileState extends State<QuestionAndAnswerTile>
    with AutomaticKeepAliveClientMixin {
  late int? selectedOption = widget.answer.isNotEmpty
      ? widget.optionsOrKeywords.indexOf(widget.answer)
      : null;
  late TextEditingController answerBoxController =
      TextEditingController(text: widget.answer);

  @override
  void initState() {
    super.initState();
    answerBoxController = TextEditingController(text: widget.answer);
    selectedOption = widget.answer.isNotEmpty
        ? widget.optionsOrKeywords.indexOf(widget.answer)
        : null;
  }

  @override
  void dispose() {
    answerBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        if (widget.hasOptions)
          ...List.generate(
              widget.optionsOrKeywords.length,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Focus(
                      child: SizedBox(
                        width: 300.w,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ChoiceChip(
                              onSelected: (_) {
                                setState(() {
                                  selectedOption = index;
                                });
                                widget
                                    .callback(widget.optionsOrKeywords[index]);
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
                    ),
                  )),
        SizedBox(
          height: 20.h,
        ),
        if (!widget.hasOptions)
          SizedBox(
            height: 100.h,
            width: 300.w,
            child: Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: PlatformTextFormField(
                controller: answerBoxController,
                keyboardType: TextInputType.text,
                expands: true,
                maxLines: null,
                minLines: null,
                onFieldSubmitted: (value) => widget.callback(value.trim()),
              ),
            ),
          )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
