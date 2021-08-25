import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String? image;
  final Color? color;
  final dynamic onPressed;
  const SocialButton({
    this.image,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        elevation: 3,
        backgroundColor: AppTheme.whiteBackColor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
      ),
      child: Image.asset(
        "$image",
        color: color,
        width: 25,
        height: 25,
      ),
    );
  }
}
