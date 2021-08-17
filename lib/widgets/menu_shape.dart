import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuShape extends StatelessWidget {
  final Categories category;
  final dynamic onTap;
  const MenuShape({required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteBackColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [AppConstant.boxShadow],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider("${category.picture}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              title: LabelText(
                label: "${category.label}",
                color: AppTheme.blackTextColor,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${category.time} min.",
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
                    " ${category.rate.toStringAsFixed(1)}",
                    style: TextStyle(
                      color: AppTheme.blackTextColor.withOpacity(.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
