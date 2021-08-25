import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/details_screen.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/function_button.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/meal_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        centerTitle: true,
        title: LabelText(
          label: "مفضلاتي",
          color: AppTheme.blackTextColor.withOpacity(.75),
        ),
        actions: [
          FunctionButton(
            icon: CupertinoIcons.cart_fill,
            onPressed: () => Get.off(() => ShoppingScreen()),
          ),
        ],
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: AppConstant.gridDelegate(childAspectRatio: 2),
        itemCount: AppConstant.menuList[0].meals.length,
        itemBuilder: (context, i) {
          Meal meal = AppConstant.menuList[0].meals[i];
          return MealShape(
            meal: meal,
            state: true,
            onTap: () => {
              Get.to(
                () => DetailsScreen(
                  index: i,
                  category: AppConstant.menuList[0],
                ),
              ),
            },
          );
        },
      ),
    );
  }
}
