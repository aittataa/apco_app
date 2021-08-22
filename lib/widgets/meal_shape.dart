import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealShape extends StatelessWidget {
  final Meal meal;
  final bool state;
  final dynamic onTap;
  const MealShape({required this.meal, required this.state, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  SizedBox(
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
                    ),
                  ),
                  SizedBox(
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
                                CupertinoIcons.cart_fill,
                                color: AppTheme.whiteIconColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: LabelText(
                              label: "${meal.time} DH",
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
                margin: EdgeInsets.all(2),
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
