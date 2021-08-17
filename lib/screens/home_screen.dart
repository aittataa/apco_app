import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:apco_app/widgets/meals_bar.dart';
import 'package:apco_app/widgets/menu_bar.dart';
import 'package:apco_app/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.phone_fill_arrow_down_left,
            color: AppTheme.blackIconColor.withOpacity(.75),
          ),
        ),
        centerTitle: true,
        title: Text(
          "${AppMessages.GREETING_TITLE}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.blackTextColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppTheme.lightMainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: AppTheme.whiteIconColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SearchBar(),
              MealsBar(index: 0),
              MenuBar(),
              MealsBar(index: AppConstant.itemIndex),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
