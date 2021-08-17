import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;
  final Color? color;
  final TextAlign? textAlign;
  const LabelText({
    required this.label,
    this.color,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "$label",
      textAlign: textAlign,
      minFontSize: 12,
      maxFontSize: 18,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
