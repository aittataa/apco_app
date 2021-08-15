import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/widgets/title_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TitleBar(
        onTap: () {},
        title: "القائمة",
      ),
      subtitle: SizedBox(
        height: 250,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          gridDelegate: AppConstant.gridDelegate(
            crossAxisCount: 1,
            childAspectRatio: 1.5,
          ),
          itemCount: AppConstant.categoriesList.length,
          itemBuilder: (context, index) {
            Categories category = AppConstant.categoriesList[index];
            return MenuShape(category: category);
          },
        ),
      ),
    );
  }
}

class MenuShape extends StatelessWidget {
  final Categories category;
  const MenuShape({required this.category});

  @override
  Widget build(BuildContext context) {
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
