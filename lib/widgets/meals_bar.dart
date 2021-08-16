import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/meals_screen.dart';
import 'package:apco_app/widgets/title_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MealsBar extends StatelessWidget {
  final int index;
  const MealsBar({required this.index});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TitleBar(
        onTap: () => Get.to(() => MealsScreen()),
        title: "${AppConstant.menuList[index].label}",
      ),
      subtitle: SizedBox(
        height: 200,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: AppConstant.menuList[index].meals.length,
          itemBuilder: (context, i) {
            Meal meal = AppConstant.menuList[index].meals[i];
            final bool state = i % 3 == 0;
            return MealShape(
              meal: meal,
              state: state,
            );
          },
        ),
      ),
    );
  }
}

class MealShape extends StatelessWidget {
  final Meal meal;
  final bool state;
  const MealShape({required this.meal, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      color: state ? AppTheme.redIconColor : AppTheme.blackIconColor,
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: AutoSizeText(
                      "${meal.label}",
                      textAlign: TextAlign.right,
                      minFontSize: 14,
                      maxFontSize: 18,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.blackTextColor,
                        fontWeight: FontWeight.w900,
                      ),
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
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.mainColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                          ),
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(
                              CupertinoIcons.shopping_cart,
                              color: AppTheme.whiteIconColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: AutoSizeText(
                            "49 DH",
                            textAlign: TextAlign.center,
                            minFontSize: 14,
                            maxFontSize: 18,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: CachedNetworkImageProvider("${meal.picture}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
