import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mesa_app/screens/home_page/home_page.dart';
import 'package:mesa_app/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
            color: Color(0xffE3562A),
            localizationsDelegates: [
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            title: 'Mesa',
            home: HomePage(),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
