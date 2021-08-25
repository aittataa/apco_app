import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFunctions {
  static appBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.to(() => ShoppingScreen()),
        padding: EdgeInsets.zero,
        splashColor: AppTheme.transparentColor,
        highlightColor: AppTheme.transparentColor,
        icon: Icon(
          CupertinoIcons.cart_fill,
          color: AppTheme.mainColor,
        ),
      ),
      centerTitle: true,
      title: LabelText(
        label: "${AppMessages.appTitle}",
        textAlign: TextAlign.center,
        color: AppTheme.blackTextColor.withOpacity(.75),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppTheme.lightMainColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () => Get.to(() => FavoriteScreen()),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: AppTheme.whiteIconColor,
            ),
          ),
        ),
      ],
    );
  }
}
