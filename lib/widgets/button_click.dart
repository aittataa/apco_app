import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:flutter/material.dart';

class ButtonClick extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color backColor;
  final dynamic onPressed;
  const ButtonClick({
    required this.label,
    required this.textColor,
    required this.backColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          animationDuration: AppConstant.duration,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: backColor,
          primary: AppTheme.whiteBackColor,
        ),
        child: LabelText(
          label: "$label",
          textAlign: TextAlign.center,
          color: textColor,
        ),
      ),
    );
  }
}
