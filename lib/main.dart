import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/utils/themes.dart';

import 'screens/login/login.dart';

void main() async {
  runApp(const MesaApp());
}

class MesaApp extends StatelessWidget {
  const MesaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      ensureScreenSize: true,
      child: PlatformProvider(
        builder: (context) => PlatformTheme(
          themeMode: ThemeMode.light,
          materialLightTheme: lightMaterialTheme,
          materialDarkTheme: darkTheme,
          cupertinoDarkTheme: iosDarkTheme,
          cupertinoLightTheme: iosLightTheme,
          builder: (context) => const PlatformApp(
            localizationsDelegates: [
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            title: 'Mesa',
            home: LoginPage(),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
