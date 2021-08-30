import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_functions.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/screens/categories_screen.dart';
import 'package:apco_app/screens/meals_screen.dart';
import 'package:apco_app/widgets/menu_shape.dart';
import 'package:apco_app/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuBar extends StatelessWidget {
  final List<Categories> myList = AppConstant.menuList;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TitleBar(
        title: "${AppMessages.menuTitle}",
        onTap: () {
          Get.to(() => CategoriesScreen());
        },
      ),
      subtitle: SizedBox(
        height: 250,
        child: GridView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          gridDelegate: AppFunctions.gridDelegate(childAspectRatio: 1.5, spacing: 10),
          itemCount: myList.length,
          itemBuilder: (context, i) {
            Categories category = myList[i];
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
