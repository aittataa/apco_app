import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/screens/login_screen.dart';
import 'package:apco_app/widgets/bounce_point.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: LoginScreen(),
      // nextScreen: HomeScreen(),
      splash: BouncePoint(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.backColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: AppConstant.duration,
      splashIconSize: double.infinity,
    );
  }
}
