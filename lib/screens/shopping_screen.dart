import 'dart:ui';

import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/payment_screen.dart';
import 'package:apco_app/widgets/cart_shape.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ShoppingScreen extends StatelessWidget {
  final bool fav = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppTheme.blackIconColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "طلباتي",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.blackTextColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
          ),
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
              onPressed: () => Get.off(() => FavoriteScreen()),
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: AppTheme.whiteIconColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        itemCount: AppConstant.menuList[0].meals.length,
        itemBuilder: (context, i) {
          Meal meal = AppConstant.menuList[0].meals[i];
          return CartShape(meal: meal);
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.lightMainColor,
          boxShadow: [AppConstant.boxShadow],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero.copyWith(right: 10),
          title: Row(
            children: [
              LabelText(
                label: "\$256",
                color: AppTheme.whiteTextColor,
                textAlign: TextAlign.end,
              ),
              Expanded(
                child: LabelText(
                  label: "إجمالي الطلبات",
                  color: AppTheme.whiteTextColor,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          leading: Container(
            margin: EdgeInsets.all(5),
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.backColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: IconButton(
              onPressed: () => Get.to(() => PaymentScreen()),
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
