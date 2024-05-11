import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key, required this.msg});
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
            width: 200.w,
            child: FittedBox(
              child: Image.asset('assets/images/empty_image.png'),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: msg,
            size: 14,
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
