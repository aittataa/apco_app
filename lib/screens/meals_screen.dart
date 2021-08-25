import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/details_screen.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/function_button.dart';
import 'package:apco_app/widgets/items_bar.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/meal_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealsScreen extends StatelessWidget {
  final int index;
  final Categories category;
  const MealsScreen({Key? key, required this.index, required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        centerTitle: true,
        title: LabelText(
          label: "${category.label}",
          color: AppTheme.blackTextColor.withOpacity(.75),
        ),
        actions: [
          FunctionButton(
            icon: CupertinoIcons.heart_fill,
            onPressed: () => Get.to(() => FavoriteScreen()),
          )
        ],
      ),
      body: Column(
        children: [
          ItemsBar(
            index: index,
            onTap: () {},
          ),
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: AppConstant.gridDelegate(childAspectRatio: 2),
              itemCount: category.meals.length,
              itemBuilder: (context, i) {
                Meal meal = category.meals[i];
                return MealShape(
                  meal: meal,
                  onTap: () => Get.to(() => DetailsScreen(index: i, category: category)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
