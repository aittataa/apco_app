import 'dart:math';

import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:apco_app/widgets/function_button.dart';
import 'package:apco_app/widgets/items_bar.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/meals_bar.dart';
import 'package:apco_app/widgets/menu_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Categories> myList;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    myList = AppConstant.menuList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.to(() => ShoppingScreen()),
          padding: EdgeInsets.zero,
          splashColor: AppTheme.transparentColor,
          highlightColor: AppTheme.transparentColor,
          icon: Icon(
            CupertinoIcons.cart_fill,
            color: AppTheme.mainColor,
          ),
        ),
        centerTitle: true,
        title: LabelText(
          label: "${AppMessages.appTitle}",
          color: AppTheme.blackTextColor.withOpacity(.75),
        ),
        actions: [
          FunctionButton(
            icon: CupertinoIcons.heart_fill,
            onPressed: () => Get.to(() => FavoriteScreen()),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          ItemsBar(
            index: AppConstant.itemIndex,
            onPageChanged: (index) {
              setState(() {
                AppConstant.itemIndex = index;
              });
            },
          ),
          MealsBar(
            category: myList[AppConstant.itemIndex],
          ),
          MenuBar(),
          MealsBar(
            category: myList[Random().nextInt(7)],
          ),
        ],
      ),
    );
  }
}
