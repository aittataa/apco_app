import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/widgets/label_text.dart';
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
    return SizedBox(
      height: 50,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: PageController(
          initialPage: index,
          viewportFraction: .3,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: AppConstant.menuList.length,
        itemBuilder: (context, i) {
          bool state = AppConstant.itemIndex == i;
          Categories category = AppConstant.menuList[i];
          return GestureDetector(
            onTap: () {
              AppConstant.itemIndex = i;
              (context as Element).markNeedsBuild();
            },
            child: AnimatedContainer(
              duration: AppConstant.duration,
              curve: AppConstant.curve,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: state ? AppTheme.lightMainColor : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: LabelText(
                label: "${category.label}",
                color: state ? AppTheme.whiteTextColor : AppTheme.blackTextColor.withOpacity(.5),
              ),
            ),
          );
        },
      ),
    );
  }
}
