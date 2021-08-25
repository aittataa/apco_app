import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/material.dart';

class FunctionButton extends StatelessWidget {
  final IconData icon;
  final dynamic onPressed;
  const FunctionButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppTheme.lightMainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        splashColor: AppTheme.transparentColor,
        highlightColor: AppTheme.transparentColor,
        icon: Icon(
          icon,
          color: AppTheme.whiteIconColor,
        ),
      ),
    );
  }
}
