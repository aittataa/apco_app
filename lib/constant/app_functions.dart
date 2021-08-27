import 'dart:math';

import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFunctions {
  static gridDelegate({int crossAxisCount = 1, double childAspectRatio = 1, double spacing = 0}) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
    );
  }

  static inputDecoration({String labelText = "", String hintText = ""}) {
    return InputDecoration(
      labelText: "$labelText",
      hintText: "$hintText",
      labelStyle: TextStyle(
        color: AppTheme.mainColor,
        fontWeight: FontWeight.w900,
      ),
      hintStyle: TextStyle(
        color: AppTheme.blackTextColor.withOpacity(.5),
        fontWeight: FontWeight.bold,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1.5, color: AppTheme.lightMainColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 2.5, color: AppTheme.lightMainColor),
      ),
    );
  }

  static get mealRate {
    Random random = Random();
    int max = 4;
    int min = 1;
    return (random.nextDouble() * (max - min + 1)) + min;
  }

  static get mealTime {
    int value = Random().nextInt(10);
    if (value <= 1) {
      return (value + 2) * 5;
    } else {
      return (value) * 5;
    }
  }

  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception("Couldn't Launch $url");
    }
  }
}
