import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;
  final Color color;
  final TextAlign textAlign;
  const LabelText({
    required this.label,
    this.color = AppTheme.blackTextColor,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$label",
      textAlign: textAlign,
      // minFontSize: 12,
      // maxFontSize: 18,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
