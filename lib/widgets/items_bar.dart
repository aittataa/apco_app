import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:flutter/material.dart';

class ItemsBar extends StatelessWidget {
  final int index;
  final bool state;
  final dynamic onTap;
  final dynamic onPageChanged;
  const ItemsBar({
    required this.index,
    this.state = false,
    this.onTap,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(
      initialPage: index,
      viewportFraction: .3,
    );
    return SizedBox(
      height: 50,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        scrollDirection: Axis.horizontal,
        controller: controller,
        pageSnapping: false,
        physics: BouncingScrollPhysics(),
        itemCount: AppConstant.menuList.length,
        itemBuilder: (context, i) {
          bool state = index == i;
          Categories category = AppConstant.menuList[i];
          return GestureDetector(
            onTap: () {
              controller.animateToPage(
                i,
                duration: AppConstant.animatedDuration,
                curve: AppConstant.curve,
              );
            },
            child: AnimatedContainer(
              duration: AppConstant.animatedDuration,
              curve: AppConstant.curve,
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 10),
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
