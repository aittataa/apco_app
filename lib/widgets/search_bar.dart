import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "${AppMessages.GREETING_SUBTITLE}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.blackTextColor.withOpacity(.75),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: TextBox(),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: TextField(
        cursorColor: AppTheme.lightMainColor,
        style: TextStyle(
          color: AppTheme.blackTextColor.withOpacity(.75),
          fontWeight: FontWeight.w900,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            CupertinoIcons.search,
            color: AppTheme.lightMainColor,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(
            color: AppTheme.blackTextColor.withOpacity(.25),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
