import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:flutter/material.dart';

class ExpandedLogo extends StatelessWidget {
  final int flex;
  const ExpandedLogo({this.flex = 1});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [AppConstant.boxShadow],
        ),
        child: Image.asset("${AppMessages.appIconRound}"),
      ),
    );
  }
}
