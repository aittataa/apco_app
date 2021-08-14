import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:flutter/material.dart';

class ItemsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        itemCount: AppConstant.categoriesList.length,
        itemBuilder: (context, index) {
          Categories category = AppConstant.categoriesList[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.lightMainColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "${category.label}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.whiteTextColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          );
        },
      ),
    );
  }
}
