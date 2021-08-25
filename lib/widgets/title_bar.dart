import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final onTap;
  const TitleBar({
    required this.title,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppTheme.lightMainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chevron_left,
                color: AppTheme.whiteIconColor,
              ),
            ),
            Expanded(
              child: LabelText(
                label: "$title",
                color: AppTheme.blackTextColor.withOpacity(.75),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
