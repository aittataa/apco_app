import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartShape extends StatelessWidget {
  final Meal meal;
  const CartShape({required this.meal});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero.copyWith(left: 10, right: 10),
        trailing: CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider("${meal.picture}"),
        ),
        title: LabelText(
          label: "${meal.label}",
          color: AppTheme.blackTextColor,
          textAlign: TextAlign.end,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                " ${meal.time.toStringAsFixed(2)} DH",
                style: TextStyle(
                  color: AppTheme.blackTextColor.withOpacity(.75),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Text(
              "${meal.time} min.",
              style: TextStyle(
                color: AppTheme.blackTextColor.withOpacity(.5),
                fontWeight: FontWeight.bold,
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
              ),
            ),
          ],
        ),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppTheme.lightMainColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              CupertinoIcons.delete_solid,
              color: AppTheme.whiteIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
