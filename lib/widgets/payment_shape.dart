import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentShape extends StatelessWidget {
  final String image;
  final String label;
  final onTap;
  const PaymentShape({
    required this.image,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        boxShadow: [AppConstant.boxShadow],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        contentPadding: EdgeInsets.zero.copyWith(left: 10, right: 10),
        trailing: CircleAvatar(
          radius: 25,
          backgroundColor: AppTheme.backColor,
          backgroundImage: CachedNetworkImageProvider("$image"),
        ),
        title: LabelText(
          label: "$label",
          textAlign: TextAlign.end,
        ),
        leading: Container(
          decoration: BoxDecoration(
            color: AppTheme.lightMainColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: onTap,
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(
              CupertinoIcons.chevron_left_2,
              color: AppTheme.whiteIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
