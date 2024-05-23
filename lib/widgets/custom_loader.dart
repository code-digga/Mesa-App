import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, required this.state});
  final String state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 300.w,
      child: FittedBox(
        child: Lottie.asset(''),
      ),
    );
  }
}
