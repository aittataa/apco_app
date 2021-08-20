import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  final Categories category;
  const DetailsScreen({required this.category});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    pageIndex = 0;
    category = widget.category;
  }

  int pageIndex = 0;
  late Categories category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.lightMainColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppTheme.whiteIconColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "${category.label}",
          style: TextStyle(
            color: AppTheme.whiteTextColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => ShoppingScreen()),
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: AppTheme.whiteIconColor,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => ShoppingScreen()),
            icon: Icon(
              CupertinoIcons.cart_fill,
              color: AppTheme.whiteIconColor,
            ),
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: category.meals.length,
        itemBuilder: (context, index) {
          Meal meal = category.meals[index];
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.lightMainColor,
                            boxShadow: [
                              AppConstant.boxShadow,
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                            image: DecorationImage(
                              image: CachedNetworkImageProvider("${meal.picture}"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.lightMainColor,
                            boxShadow: [
                              AppConstant.boxShadow,
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                            image: DecorationImage(
                              image: CachedNetworkImageProvider("${meal.picture}"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      // color: AppTheme.lightMainColor,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
