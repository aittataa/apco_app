import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/meals_screen.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/floating_button.dart';
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
        title: Text(
          "القائمة",
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
              onPressed: () => Get.to(() => FavoriteScreen()),
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: AppTheme.whiteIconColor,
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        gridDelegate: AppConstant.gridDelegate(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: AppConstant.menuList.length,
        itemBuilder: (context, index) {
          Categories category = AppConstant.menuList[index];
          return MenuShape(
            category: category,
            onTap: () {
              //AppConstant.itemIndex = index;
              Get.to(() => MealsScreen(index: index, category: category));
            },
          );
        },
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
