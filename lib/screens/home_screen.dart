import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:apco_app/widgets/items_bar.dart';
import 'package:apco_app/widgets/menu_bar.dart';
import 'package:apco_app/widgets/menu_item.dart';
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
            CupertinoIcons.list_bullet_indent,
            color: AppTheme.blackIconColor,
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
                CupertinoIcons.heart,
                color: AppTheme.whiteIconColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(),
              ItemsBar(),
              MenuItem(),
              MenuBar(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
