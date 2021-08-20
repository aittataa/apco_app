import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:apco_app/widgets/items_bar.dart';
import 'package:apco_app/widgets/meals_bar.dart';
import 'package:apco_app/widgets/menu_bar.dart';
import 'package:apco_app/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.to(() => ShoppingScreen()),
          icon: Icon(
            CupertinoIcons.cart_fill,
            color: AppTheme.mainColor,
            size: 27,
          ),
        ),
        centerTitle: true,
        title: Text(
          "${AppMessages.GREETING_TITLE}",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SearchBar(),
            ItemsBar(index: 0),
            MealsBar(
              index: 0,
              category: AppConstant.menuList[0],
            ),
            MenuBar(),
            MealsBar(
              index: 1,
              category: AppConstant.menuList[1],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
