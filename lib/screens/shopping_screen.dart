import 'dart:ui';

import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/payment_screen.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/cart_shape.dart';
import 'package:apco_app/widgets/function_button.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        centerTitle: true,
        title: LabelText(
          label: "${AppMessages.shoppingTitle}",
          color: AppTheme.blackTextColor.withOpacity(.75),
        ),
        actions: [
          FunctionButton(
            icon: CupertinoIcons.heart_fill,
            onPressed: () {
              Get.off(() => FavoriteScreen());
            },
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(5),
        itemCount: AppConstant.menuList[0].meals.length,
        itemBuilder: (context, i) {
          Meal meal = AppConstant.menuList[0].meals[i];
          return CartShape(meal: meal);
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppTheme.lightMainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero.copyWith(right: 20),
          title: Row(
            children: [
              LabelText(
                label: "250 ${AppMessages.currencyUnit}",
                color: AppTheme.whiteTextColor,
                textAlign: TextAlign.end,
              ),
              Expanded(
                child: LabelText(
                  label: "${AppMessages.totalShopping}",
                  color: AppTheme.whiteTextColor,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          leading: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppTheme.backColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                Get.to(() => PaymentScreen());
              },
              padding: EdgeInsets.zero,
              splashColor: AppTheme.transparentColor,
              highlightColor: AppTheme.transparentColor,
              icon: Icon(
                CupertinoIcons.chevron_left_2,
                color: AppTheme.mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
