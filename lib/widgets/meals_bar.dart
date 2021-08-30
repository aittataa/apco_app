import 'package:apco_app/models/categories.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/details_screen.dart';
import 'package:apco_app/screens/meals_screen.dart';
import 'package:apco_app/widgets/meal_shape.dart';
import 'package:apco_app/widgets/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MealsBar extends StatelessWidget {
  final Categories category;
  //final dynamic onTap;
  const MealsBar({
    required this.category,
    //this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TitleBar(
        title: "${category.label}",
        onTap: () {
          Get.to(() => MealsScreen(category: category));
        },
      ),
      subtitle: SizedBox(
        height: 200,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: category.meals.length,
          itemBuilder: (context, i) {
            Meal meal = category.meals[i];
            return MealShape(
              meal: meal,
              onTap: () {
                Get.to(() => DetailsScreen(index: i, category: category));
              },
            );
          },
        ),
      ),
    );
  }
}
