import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Hello,',
                        size: 16,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const CustomText(
                        text: 'Shalom Nankam',
                        size: 22,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Badge(
                  backgroundColor: Colors.red,
                  label: const CustomText(
                    text: '2',
                  ),
                  largeSize: 20,
                  offset: const Offset(0, -3),
                  child: PlatformIconButton(
                    onPressed: () {},
                    materialIcon: const Icon(Icons.notifications_none),
                    cupertinoIcon: const Icon(CupertinoIcons.bell),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            const CustomText(text: 'Menu:'),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 1.0,
                        crossAxisCount: 2),
                    children: List.generate(
                        6,
                        (index) => _HomeCard(
                              title: 'Home Title is a go',
                              image: 'assets/images/empty_image.png',
                              goToPage: () {},
                            ))))
          ],
        )),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({required this.title, required this.image, this.goToPage});
  final String title, image;
  final void Function()? goToPage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToPage,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: FittedBox(
                  child: Image.asset(image),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: title,
                  size: 16,
                  weight: FontWeight.w400,
                  overflow: TextOverflow.clip,
                  alignment: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
