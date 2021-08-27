import 'dart:math';

import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_functions.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/details_screen.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/function_button.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/meal_shape.dart';
import 'package:apco_app/widgets/search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  final int random = Random().nextInt(7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        centerTitle: true,
        title: LabelText(
          label: "${AppMessages.favoriteTitle}",
          color: AppTheme.blackTextColor.withOpacity(.75),
        ),
        actions: [
          FunctionButton(
            icon: CupertinoIcons.cart_fill,
            onPressed: () {
              Get.off(() => ShoppingScreen());
            },
          ),
        ],
      ),
      body: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: SearchBox(),
        ),
        subtitle: GridView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: AppFunctions.gridDelegate(childAspectRatio: 2),
          itemCount: AppConstant.menuList[random].meals.length,
          itemBuilder: (context, i) {
            Meal meal = AppConstant.menuList[random].meals[i];
            return MealShape(
              meal: meal,
              state: true,
              onTap: () {
                Get.to(() => DetailsScreen(index: i, category: AppConstant.menuList[random]));
              },
            );
          },
        ),
      ),
    );
  }
}
