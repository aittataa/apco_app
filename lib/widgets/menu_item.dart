import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/widgets/title_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TitleBar(
        onTap: () {},
        title: "الوجبات الأساسية",
      ),
      subtitle: SizedBox(
        height: 200,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: AppConstant.categoriesList.length,
          itemBuilder: (context, index) {
            Categories category = AppConstant.categoriesList[index];
            final bool state = index % 3 == 0;
            return ItemShape(
              category: category,
              state: state,
            );
          },
        ),
      ),
    );
  }
}

class ItemShape extends StatelessWidget {
  final Categories category;
  final bool state;

  const ItemShape({required this.category, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      color: state ? AppTheme.redIconColor : AppTheme.blackIconColor,
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: AutoSizeText(
                      "${category.label}",
                      textAlign: TextAlign.right,
                      minFontSize: 14,
                      maxFontSize: 18,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.blackTextColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "30 min.",
                          style: TextStyle(
                            color: AppTheme.blackTextColor.withOpacity(.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: AppTheme.lightMainColor,
                        ),
                        Text(
                          " 4.3",
                          style: TextStyle(
                            color: AppTheme.blackTextColor.withOpacity(.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.mainColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                          ),
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(
                              CupertinoIcons.shopping_cart,
                              color: AppTheme.whiteIconColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: AutoSizeText(
                            "49 DH",
                            textAlign: TextAlign.center,
                            minFontSize: 14,
                            maxFontSize: 18,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: CachedNetworkImageProvider("${category.picture}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
