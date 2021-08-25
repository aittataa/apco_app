import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: AppTheme.mainColor,
      activeBackgroundColor: AppTheme.lightMainColor,
      foregroundColor: AppTheme.whiteIconColor,
      elevation: 1,
      buttonSize: 50,
      overlayOpacity: 0.5,
      overlayColor: AppTheme.backColor,
      icon: CupertinoIcons.text_alignleft,
      activeIcon: CupertinoIcons.clear,
      spaceBetweenChildren: 5,
      childMargin: EdgeInsets.all(5),
      curve: AppConstant.curve,
      animationSpeed: 250,
      children: [
        SpeedDialChild(
          onTap: () {},
          child: Icon(CupertinoIcons.headphones),
          label: "${AppMessages.contactUs}",
          labelStyle: TextStyle(
            color: AppTheme.mainColor,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: AppTheme.whiteBackColor,
          foregroundColor: AppTheme.lightMainColor,
        ),
        SpeedDialChild(
          onTap: () => AppConstant.launchURL("${AppMessages.textUsUrl}"),
          child: Icon(CupertinoIcons.chat_bubble_fill),
          label: "${AppMessages.textUs}",
          labelStyle: TextStyle(
            color: AppTheme.mainColor,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: AppTheme.whiteBackColor,
          foregroundColor: AppTheme.lightMainColor,
        ),
        SpeedDialChild(
          onTap: () => AppConstant.launchURL("${AppMessages.callUsUrl}"),
          child: Icon(CupertinoIcons.phone_fill),
          label: "${AppMessages.callUs}",
          labelStyle: TextStyle(
            color: AppTheme.mainColor,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: AppTheme.whiteBackColor,
          foregroundColor: AppTheme.lightMainColor,
        ),
      ],
    );
  }
}
