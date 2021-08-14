import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
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
                "الوجبات الأساسية",
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
      subtitle: SizedBox(
        height: 250,
        child: PageView.builder(
          controller: PageController(viewportFraction: .9),
          physics: BouncingScrollPhysics(),

          //padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          // gridDelegate: AppConstant.gridDelegate(
          //   crossAxisCount: 1,
          //   childAspectRatio: 1.5,
          // ),
          itemCount: AppConstant.categoriesList.length,
          itemBuilder: (context, index) {
            Categories category = AppConstant.categoriesList[index];
            return ItemShape(category: category);
          },
        ),
      ),
    );
  }
}

class ItemShape extends StatelessWidget {
  final Categories category;
  const ItemShape({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            title: AutoSizeText(
              "${category.label}",
              textAlign: TextAlign.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
