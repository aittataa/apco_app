import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/button_click.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/text_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  final bool state = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: SizedBox(
        height: AppConstant.screenHeight * .9,
        child: ListView(
          children: [
            ListTile(
              title: LabelText(
                label: "${AppMessages.deliveryPageTitle}",
                color: AppTheme.blackTextColor.withOpacity(.75),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              minVerticalPadding: 1,
              title: TextBox(
                controller: TextEditingController(),
                hint: "${AppMessages.addressHint}",
                icon: CupertinoIcons.house_alt_fill,
                keyboardType: TextInputType.text,
                suffixIcon: Icon(
                  state ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                  color: state ? AppTheme.lightMainColor : AppTheme.redIconColor,
                ),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              minVerticalPadding: 1,
              title: TextBox(
                controller: TextEditingController(),
                hint: "${AppMessages.zipCodeHint}",
                icon: CupertinoIcons.location_solid,
                keyboardType: TextInputType.number,
                suffixIcon: Icon(
                  state ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                  color: state ? AppTheme.lightMainColor : AppTheme.redIconColor,
                ),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              minVerticalPadding: 1,
              title: TextBox(
                controller: TextEditingController(),
                hint: "${AppMessages.stateHint}",
                icon: CupertinoIcons.building_2_fill,
                keyboardType: TextInputType.text,
                suffixIcon: Icon(
                  state ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                  color: state ? AppTheme.lightMainColor : AppTheme.redIconColor,
                ),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              minVerticalPadding: 1,
              title: ButtonClick(
                label: "${AppMessages.confirmTitle}",
                textColor: AppTheme.whiteTextColor,
                backColor: AppTheme.mainColor,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              minVerticalPadding: 1,
              title: LabelText(
                label: "${AppMessages.orTitle}",
                color: AppTheme.blackTextColor.withOpacity(.75),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              minVerticalPadding: 1,
              title: ButtonClick(
                label: "${AppMessages.fakeAddress}",
                textColor: AppTheme.whiteTextColor,
                backColor: AppTheme.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
