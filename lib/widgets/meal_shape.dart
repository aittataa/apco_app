import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/shopping_screen.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealShape extends StatelessWidget {
  final Meal meal;
  final bool state;
  final dynamic onTap;
  const MealShape({required this.meal, this.state = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.whiteBackColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [AppConstant.boxShadow],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        splashColor: AppTheme.transparentColor,
                        highlightColor: AppTheme.transparentColor,
                        icon: Icon(
                          state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                          color: state ? AppTheme.redIconColor : AppTheme.blackIconColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero.copyWith(right: 10),
                      title: LabelText(
                        label: "${meal.label}",
                        color: AppTheme.blackTextColor,
                        textAlign: TextAlign.end,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LabelText(
                            label: "${meal.time} ${AppMessages.timeUnit}",
                            color: AppTheme.blackTextColor.withOpacity(.5),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.star,
                            color: AppTheme.lightMainColor,
                            size: 15,
                          ),
                          SizedBox(width: 2),
                          LabelText(
                            label: "${meal.rate.toStringAsFixed(1)}",
                            color: AppTheme.blackTextColor.withOpacity(.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: LabelText(
                              label: "${meal.time} ${AppMessages.currencyUnit}",
                              color: AppTheme.blackTextColor,
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
                margin: EdgeInsets.all(1),
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
      ),
    );
  }
}
