import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appTitle,
      themeMode: ThemeMode.light,
      color: AppTheme.backColor,
      theme: ThemeData(
        primaryColor: AppTheme.backColor,
        scaffoldBackgroundColor: AppTheme.backColor,
      ),
      // home: HomeScreen(),
      home: Splash(),
    );
  }
}
