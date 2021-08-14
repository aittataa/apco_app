import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../constant/app_theme.dart';
import '../screens/home_screen.dart';
import '../widgets/bounce_point.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: HomeScreen(),
      splash: BouncePoint(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.backColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: AppConstant.duration,
      splashIconSize: double.infinity,
    );
  }
}
