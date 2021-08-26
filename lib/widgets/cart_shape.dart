import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
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
        dense: true,
        contentPadding: EdgeInsets.zero.copyWith(left: 10, right: 10),
        trailing: CircleAvatar(
          radius: 25,
          backgroundColor: AppTheme.backColor,
          backgroundImage: CachedNetworkImageProvider("${meal.picture}"),
        ),
        title: Row(
          children: [
            LabelText(
              label: "${meal.time.toStringAsFixed(2)} ${AppMessages.currencyUnit}",
              textAlign: TextAlign.center,
              color: AppTheme.blackTextColor,
            ),
            Expanded(
              child: LabelText(
                label: "${meal.label}",
                color: AppTheme.blackTextColor,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LabelText(
              label: "${meal.time} ${AppMessages.timeUnit}",
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
        leading: Container(
          decoration: BoxDecoration(
            color: AppTheme.lightMainColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: null,
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
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
