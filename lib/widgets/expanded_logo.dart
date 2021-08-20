import 'package:apco_app/constant/app_constant.dart';
import 'package:flutter/material.dart';

class ExpandedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [AppConstant.boxShadow],
        ),
        child: Image.asset("assets/icons/app_icon_round_1.0.png"),
      ),
    );
  }
}
