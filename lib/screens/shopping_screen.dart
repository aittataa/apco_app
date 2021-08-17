import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/meal.dart';
import 'package:apco_app/screens/favorite_screen.dart';
import 'package:apco_app/widgets/floating_button.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppTheme.blackIconColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "طلباتي",
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
              onPressed: () => Get.off(() => FavoriteScreen()),
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: AppTheme.whiteIconColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        // gridDelegate: AppConstant.gridDelegate(
        // crossAxisCount: 1,
        // childAspectRatio: 2,
        // ),
        itemCount: AppConstant.menuList[0].meals.length,
        itemBuilder: (context, i) {
          Meal meal = AppConstant.menuList[0].meals[i];
          return CartShape(meal: meal, state: true);
        },
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}

class CartShape extends StatelessWidget {
  final Meal meal;
  final bool state;
  const CartShape({required this.meal, required this.state});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero.copyWith(left: 10, right: 10),
        trailing: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider("${meal.picture}"),
        ),
        title: LabelText(
          label: "${meal.label}",
          color: AppTheme.blackTextColor,
          textAlign: TextAlign.end,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                " ${meal.time.toStringAsFixed(2)} DH",
                style: TextStyle(
                  color: AppTheme.blackTextColor.withOpacity(.75),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Text(
              "${meal.time} min.",
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
              " ${meal.rate.toStringAsFixed(1)}",
              style: TextStyle(
                color: AppTheme.blackTextColor.withOpacity(.5),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
        leading: Container(
          alignment: Alignment.center,
          width: 64,
          decoration: BoxDecoration(
            color: AppTheme.lightMainColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              CupertinoIcons.delete_solid,
              color: AppTheme.whiteIconColor,
            ),
          ),
        ),
      ),
      // child: Row(
      //   children: [
      //     Expanded(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Align(
      //             alignment: Alignment.topLeft,
      //             child: IconButton(
      //               onPressed: () {},
      //               icon: Icon(
      //                 state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
      //                 color: state ? AppTheme.redIconColor : AppTheme.blackIconColor,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             child: ListTile(
      //               title: LabelText(
      //                 label: "${meal.label}",
      //                 color: AppTheme.blackTextColor,
      //                 textAlign: TextAlign.end,
      //               ),
      //               subtitle: Row(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: [
      //                   Text(
      //                     "${meal.time} min.",
      //                     style: TextStyle(
      //                       color: AppTheme.blackTextColor.withOpacity(.5),
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 13,
      //                     ),
      //                   ),
      //                   SizedBox(width: 10),
      //                   Icon(
      //                     Icons.star,
      //                     size: 16,
      //                     color: AppTheme.lightMainColor,
      //                   ),
      //                   Text(
      //                     " ${meal.rate.toStringAsFixed(1)}",
      //                     style: TextStyle(
      //                       color: AppTheme.blackTextColor.withOpacity(.5),
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 13,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             child: Row(
      //               children: [
      //                 Expanded(
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       color: AppTheme.mainColor,
      //                       borderRadius: BorderRadius.only(
      //                         topRight: Radius.circular(25),
      //                         bottomLeft: Radius.circular(25),
      //                       ),
      //                     ),
      //                     child: IconButton(
      //                       onPressed: null,
      //                       icon: Icon(
      //                         CupertinoIcons.cart_fill,
      //                         color: AppTheme.whiteIconColor,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: Container(
      //                     padding: EdgeInsets.all(10),
      //                     child: LabelText(
      //                       label: "${meal.time} DH",
      //                       color: AppTheme.blackTextColor,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         margin: EdgeInsets.all(2),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(25),
      //           image: DecorationImage(
      //             image: CachedNetworkImageProvider("${meal.picture}"),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
