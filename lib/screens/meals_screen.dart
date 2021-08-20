import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/details_screen.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:apco_app/widgets/items_bar.dart';
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppTheme.blackIconColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "${category.label}",
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
              onPressed: null,
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: AppTheme.whiteIconColor,
              ),
            ),
          ),
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
              padding: EdgeInsets.all(5),
              gridDelegate: AppConstant.gridDelegate(
                crossAxisCount: 1,
                childAspectRatio: 2,
              ),
              itemCount: category.meals.length,
              itemBuilder: (context, i) {
                Meal meal = category.meals[i];
                return MealShape(
                  meal: meal,
                  state: true,
                  onTap: () => Get.to(() => DetailsScreen(category: category)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
