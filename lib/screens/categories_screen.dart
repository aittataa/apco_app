import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/meals_screen.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/function_button.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/menu_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        centerTitle: true,
        title: LabelText(
          label: "القائمة",
          color: AppTheme.blackTextColor.withOpacity(.75),
        ),
        actions: [
          FunctionButton(
            icon: CupertinoIcons.heart_fill,
            onPressed: () {
              Get.to(() => FavoriteScreen());
            },
          ),
        ],
      ),
      body: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        gridDelegate: AppConstant.gridDelegate(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          spacing: 10,
        ),
        itemCount: AppConstant.menuList.length,
        itemBuilder: (context, i) {
          Categories category = AppConstant.menuList[i];
          return MenuShape(
            category: category,
            onTap: () {
              AppConstant.itemIndex = i;
              Get.to(() => MealsScreen(category: category));
            },
          );
        },
      ),
    );
  }
}
