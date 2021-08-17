import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:apco_app/widgets/items_bar.dart';
import 'package:apco_app/widgets/meal_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  final int index;
  const MealsScreen({Key? key, required this.index});
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
          "${AppConstant.menuList[index].label}",
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
              itemCount: AppConstant.menuList[index].meals.length,
              itemBuilder: (context, i) {
                Meal meal = AppConstant.menuList[index].meals[i];
                return MealShape(meal: meal);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
