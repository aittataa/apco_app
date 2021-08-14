import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant/app_constant.dart';
import 'constant/app_theme.dart';
import 'widgets/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppTheme.backColor,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(APCO());
}

class APCO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appTitle,
      themeMode: ThemeMode.light,
      color: AppTheme.backColor,
      theme: ThemeData(
        primaryColor: AppTheme.backColor,
        scaffoldBackgroundColor: AppTheme.backColor,
      ),
      home: Splash(),
    );
  }
}
