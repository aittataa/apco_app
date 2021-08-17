import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/meals_screen.dart';
import 'package:apco_app/widgets/meal_shape.dart';
import 'package:apco_app/widgets/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MealsBar extends StatelessWidget {
  final int index;
  const MealsBar({required this.index});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TitleBar(
        title: "${AppConstant.menuList[index].label}",
        onTap: () {
          AppConstant.itemIndex = index;
          Get.to(() => MealsScreen(index: index));
        },
      ),
      subtitle: SizedBox(
        height: 200,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: AppConstant.menuList[index].meals.length,
          itemBuilder: (context, i) {
            Meal meal = AppConstant.menuList[index].meals[i];
            return MealShape(
              meal: meal,
              state: index % 3 == 0,
            );
          },
        ),
      ),
    );
  }
}
