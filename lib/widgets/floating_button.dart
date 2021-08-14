import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      dialRoot: null,
      visible: true,
      backgroundColor: AppTheme.mainColor,
      activeBackgroundColor: AppTheme.lightMainColor,
      foregroundColor: AppTheme.whiteIconColor,
      elevation: 1,
      overlayOpacity: 0.5,
      overlayColor: AppTheme.backColor,
      icon: CupertinoIcons.shopping_cart,
      activeIcon: CupertinoIcons.clear,
      spaceBetweenChildren: 10,
      curve: AppConstant.curve,
      animationSpeed: 250,
      children: [
        SpeedDialChild(
          onTap: () => {AppConstant.launchURL("tel:+212673377573")},
          child: Icon(CupertinoIcons.phone_fill),
          backgroundColor: AppTheme.whiteBackColor,
          foregroundColor: AppTheme.lightMainColor,
        ),
        SpeedDialChild(
          onTap: () => {AppConstant.launchURL("https:www.google.com")},
          child: Icon(CupertinoIcons.chat_bubble_fill),
          backgroundColor: AppTheme.whiteBackColor,
          foregroundColor: AppTheme.lightMainColor,
        ),
      ],
    );
  }
}
