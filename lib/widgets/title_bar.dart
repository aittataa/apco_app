import 'package:apco_app/constant/app_theme.dart';
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
        padding: EdgeInsets.all(10),
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
              child: Text(
                "$title",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppTheme.blackTextColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
