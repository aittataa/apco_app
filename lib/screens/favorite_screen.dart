import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/details_screen.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:apco_app/widgets/meal_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
          "مفضلاتي",
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
              onPressed: () => Get.off(() => ShoppingScreen()),
              icon: Icon(
                CupertinoIcons.cart_fill,
                color: AppTheme.whiteIconColor,
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(5),
        gridDelegate: AppConstant.gridDelegate(
          crossAxisCount: 1,
          childAspectRatio: 2,
        ),
        itemCount: AppConstant.menuList[0].meals.length,
        itemBuilder: (context, i) {
          Meal meal = AppConstant.menuList[0].meals[i];
          return MealShape(
            meal: meal,
            state: true,
            onTap: () => Get.to(() => DetailsScreen(category: AppConstant.menuList[0])),
          );
        },
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
