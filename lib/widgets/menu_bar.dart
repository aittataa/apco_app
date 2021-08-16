import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/screens/categories_screen.dart';
import 'package:apco_app/widgets/menu_shape.dart';
import 'package:apco_app/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TitleBar(
        onTap: () => Get.to(() => CategoriesScreen()),
        title: "القائمة",
      ),
      subtitle: SizedBox(
        height: 250,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          gridDelegate: AppConstant.gridDelegate(
            crossAxisCount: 1,
            childAspectRatio: 1.5,
          ),
          itemCount: AppConstant.menuList.length,
          itemBuilder: (context, index) {
            Categories category = AppConstant.menuList[index];
            return MenuShape(category: category);
          },
        ),
      ),
    );
  }
}
