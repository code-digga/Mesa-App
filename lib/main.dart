import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/onboarding/onboarding.dart';
import 'package:mesa_app/utils/themes.dart';

void main() async {
  runApp(const MesaApp());
}

class MesaApp extends StatelessWidget {
  const MesaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (context) => PlatformTheme(
        themeMode: ThemeMode.system,
        materialLightTheme: lightMaterialTheme,
        materialDarkTheme: darkTheme,
        cupertinoDarkTheme: iosDarkTheme,
        cupertinoLightTheme: iosLightTheme,
        builder: (context) => const ScreenUtilInit(
          designSize: Size(375, 812),
          minTextAdapt: true,
          ensureScreenSize: true,
          child: PlatformApp(
            localizationsDelegates: [
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            title: 'Mesa',
            home: OnboardingPage(),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
