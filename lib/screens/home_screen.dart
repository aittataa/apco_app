import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        title: Text(
          "${AppMessages.GREETING_TITLE}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.blackTextColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
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
              /// First
              Container(
                child: ListTile(
                  title: Text(
                    "${AppMessages.GREETING_SUBTITLE}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.blackTextColor.withOpacity(.75),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              /// Second
              Container(
                height: 50,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstant.categoriesList.length,
                  itemBuilder: (context, index) {
                    Categories category = AppConstant.categoriesList[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      decoration: BoxDecoration(
                        color: AppTheme.lightMainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "${category.label}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.whiteTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// Third
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppTheme.lightMainColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: AppTheme.whiteIconColor,
                            size: 27,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "القائمة",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppTheme.blackTextColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Container(
                    height: 250,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: AppConstant.gridDelegate(
                        crossAxisCount: 1,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: AppConstant.categoriesList.length,
                      itemBuilder: (context, index) {
                        Categories category = AppConstant.categoriesList[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: AppTheme.whiteBackColor,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [AppConstant.boxShadow],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider("${category.picture}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "${category.label}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppTheme.blackTextColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "30 min.",
                                      style: TextStyle(
                                        color: AppTheme.blackTextColor.withOpacity(.5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: AppTheme.mainColor,
                                    ),
                                    Text(
                                      " 4.3",
                                      style: TextStyle(
                                        color: AppTheme.blackTextColor.withOpacity(.5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
