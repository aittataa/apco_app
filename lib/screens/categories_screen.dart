import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_functions.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/meals_screen.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/function_button.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/menu_shape.dart';
import 'package:apco_app/widgets/search_box.dart';
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
          label: "${AppMessages.menuTitle}",
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
          padding: EdgeInsets.all(10),
          gridDelegate: AppFunctions.gridDelegate(
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
                Get.to(() => MealsScreen(category: category));
              },
            );
          },
        ),
      ),
    );
  }
}
