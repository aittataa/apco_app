import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final Categories category;
  const DetailsScreen({required this.index, required this.category});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    pageIndex = widget.index;
    category = widget.category;
  }

  int pageIndex = 0;
  late Categories category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppTheme.mainColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "${category.label}",
          style: TextStyle(
            color: AppTheme.mainColor, //.withOpacity(.75),
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          /*
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppTheme.lightMainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () => Get.off(() => FavoriteScreen()),
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: AppTheme.whiteIconColor,
              ),
            ),
          ),
          */

          IconButton(
            onPressed: () => Get.to(() => FavoriteScreen()),
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: AppTheme.mainColor,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => ShoppingScreen()),
            icon: Icon(
              CupertinoIcons.cart_fill,
              color: AppTheme.mainColor,
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: PageController(initialPage: pageIndex),
        itemCount: category.meals.length,
        itemBuilder: (context, index) {
          Meal meal = category.meals[index];
          return Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [AppConstant.boxShadow],
                    image: DecorationImage(
                      image: CachedNetworkImageProvider("${meal.picture}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  title: LabelText(
                    label: "${meal.label}",
                    color: AppTheme.blackTextColor,
                    textAlign: TextAlign.end,
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${meal.time} min.",
                        style: TextStyle(
                          color: AppTheme.blackTextColor.withOpacity(.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: AppTheme.lightMainColor,
                      ),
                      Text(
                        " ${meal.rate.toStringAsFixed(1)}",
                        style: TextStyle(
                          color: AppTheme.blackTextColor.withOpacity(.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  leading: Text(
                    "${meal.time} DH",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: LabelText(
                    label: "المقادير",
                    color: AppTheme.blackTextColor,
                  ),
                  subtitle: SizedBox(
                    height: 100,
                    child: GridView.builder(
                      reverse: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: AppConstant.gridDelegate(childAspectRatio: 1.25),
                      itemCount: meal.rate.floor(),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppTheme.whiteBackColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [AppConstant.boxShadow],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider("${meal.picture}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              LabelText(
                                label: "${meal.label}",
                                textAlign: TextAlign.center,
                                color: AppTheme.blackTextColor.withOpacity(.75),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  tileColor: AppTheme.lightMainColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: AppTheme.whiteIconColor,
                      ),
                    ),
                  ),
                  title: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.whiteBackColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.mainColor, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: null,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            CupertinoIcons.plus,
                            color: AppTheme.blackIconColor.withOpacity(.75),
                          ),
                        ),
                        LabelText(
                          label: "0${meal.rate.floor()}",
                          textAlign: TextAlign.center,
                          color: AppTheme.blackTextColor.withOpacity(.75),
                        ),
                        IconButton(
                          onPressed: null,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            CupertinoIcons.minus,
                            color: AppTheme.blackIconColor.withOpacity(.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        CupertinoIcons.cart_fill,
                        color: AppTheme.whiteIconColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
