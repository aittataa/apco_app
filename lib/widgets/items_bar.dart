import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ItemsBar extends StatelessWidget {
  final int index;
  final onTap;
  const ItemsBar({
    required this.index,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(5),
        controller: ScrollController(initialScrollOffset: index.toDouble()),
        scrollDirection: Axis.horizontal,
        itemCount: AppConstant.menuList.length,
        itemBuilder: (context, index) {
          bool state = AppConstant.itemIndex == index;
          Categories category = AppConstant.menuList[index];
          return AnimatedContainer(
            duration: AppConstant.duration,
            curve: AppConstant.curve,
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: state ? AppTheme.lightMainColor : Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: AutoSizeText(
              "${category.label}",
              textAlign: TextAlign.center,
              minFontSize: 12,
              maxFontSize: 18,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: state ? AppTheme.whiteTextColor : AppTheme.blackTextColor.withOpacity(.5),
                fontWeight: FontWeight.w900,
              ),
            ),
          );
        },
      ),
    );
  }
}
