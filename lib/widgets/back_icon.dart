import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        CupertinoIcons.chevron_back,
        color: AppTheme.blackIconColor,
      ),
    );
  }
}
