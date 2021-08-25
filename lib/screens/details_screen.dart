import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/back_icon.dart';
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
  int pageIndex = 0;
  late Categories category;
  @override
  void initState() {
    super.initState();
    pageIndex = widget.index;
    category = widget.category;
  }

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        centerTitle: true,
        title: LabelText(
          label: "${category.label}",
          color: AppTheme.mainColor,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => FavoriteScreen()),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: AppTheme.mainColor,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => ShoppingScreen()),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
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
                  margin: EdgeInsets.all(10),
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
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: LabelText(
                    label: "${meal.label}",
                    color: AppTheme.blackTextColor,
                    textAlign: TextAlign.end,
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LabelText(
                        label: "${meal.time} min.",
                        color: AppTheme.blackTextColor.withOpacity(.5),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: AppTheme.lightMainColor,
                      ),
                      SizedBox(width: 2),
                      LabelText(
                        label: "${meal.rate.toStringAsFixed(1)}",
                        color: AppTheme.blackTextColor.withOpacity(.5),
                      ),
                    ],
                  ),
                  leading: LabelText(
                    label: "${meal.time} DH",
                    textAlign: TextAlign.center,
                    color: AppTheme.blackTextColor,
                  ),
                ),
              ),
              SizedBox(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: LabelText(
                    label: "المقادير",
                    color: AppTheme.blackTextColor.withOpacity(.75),
                  ),
                  subtitle: SizedBox(
                    height: 100,
                    child: GridView.builder(
                      reverse: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: AppConstant.gridDelegate(childAspectRatio: 1.25, spacing: 5),
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
                                child: Container(
                                  margin: EdgeInsets.all(.5),
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.lightMainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.all(5),
                  minVerticalPadding: 0,
                  horizontalTitleGap: 10,
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.whiteBackColor, width: 1.5),
                    ),
                    child: IconButton(
                      onPressed: () => Get.to(() => FavoriteScreen()),
                      padding: EdgeInsets.zero,
                      splashColor: AppTheme.transparentColor,
                      highlightColor: AppTheme.transparentColor,
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
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() => {quantity++});
                          },
                          padding: EdgeInsets.zero,
                          splashColor: AppTheme.transparentColor,
                          highlightColor: AppTheme.transparentColor,
                          icon: Icon(
                            CupertinoIcons.plus,
                            color: AppTheme.blackIconColor.withOpacity(.75),
                          ),
                        ),
                        LabelText(
                          label: quantity < 10 ? "0$quantity" : "$quantity",
                          color: AppTheme.blackTextColor.withOpacity(.75),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() => {if (quantity != 1) quantity--});
                          },
                          padding: EdgeInsets.zero,
                          splashColor: AppTheme.transparentColor,
                          highlightColor: AppTheme.transparentColor,
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
                      border: Border.all(color: AppTheme.whiteBackColor, width: 1.5),
                    ),
                    child: IconButton(
                      onPressed: () => Get.to(() => ShoppingScreen()),
                      padding: EdgeInsets.zero,
                      splashColor: AppTheme.transparentColor,
                      highlightColor: AppTheme.transparentColor,
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
