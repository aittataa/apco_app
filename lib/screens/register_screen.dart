import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/screens/home_screen.dart';
import 'package:apco_app/screens/login_screen.dart';
import 'package:apco_app/widgets/button_click.dart';
import 'package:apco_app/widgets/expanded_logo.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/text_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.lightMainColor.withOpacity(.5),
        child: SafeArea(
          child: Column(
            children: [
              ExpandedLogo(),
              AnimatedContainer(
                duration: AppConstant.duration,
                curve: AppConstant.curve,
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: AppTheme.backColor,
                  boxShadow: [AppConstant.boxShadow],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minVerticalPadding: 1.5,
                        title: TextBox(
                          controller: TextEditingController(),
                          hint: "الاسم بالكامل",
                          icon: CupertinoIcons.person_crop_circle,
                          keyboardType: TextInputType.name,
                          suffixIcon: Icon(
                            true ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                            color: true ? AppTheme.lightMainColor : AppTheme.redIconColor,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minVerticalPadding: 1.5,
                        title: TextBox(
                          controller: TextEditingController(),
                          hint: "البريد الإلكتروني",
                          icon: CupertinoIcons.mail_solid,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: Icon(
                            true ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                            color: true ? AppTheme.lightMainColor : AppTheme.redIconColor,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minVerticalPadding: 1.5,
                        title: TextBox(
                          controller: TextEditingController(),
                          hint: "كلمة المرور",
                          icon: CupertinoIcons.lock_shield_fill,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: true ? AppTheme.blackIconColor.withOpacity(.25) : AppTheme.lightMainColor,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minVerticalPadding: 1.5,
                        title: TextBox(
                          controller: TextEditingController(),
                          hint: "رقم الهاتف",
                          icon: CupertinoIcons.phone_fill,
                          keyboardType: TextInputType.phone,
                          suffixIcon: Icon(
                            true ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                            color: true ? AppTheme.lightMainColor : AppTheme.redIconColor,
                          ),
                        ),
                      ),
                      ListTile(
                        title: ButtonClick(
                          label: "إنشاء حساب",
                          textColor: AppTheme.whiteTextColor,
                          backColor: AppTheme.mainColor,
                          onPressed: () => Get.offAll(() => HomeScreen()),
                        ),
                      ),
                      ListTile(
                        onTap: () => Get.off(() => LoginScreen()),
                        title: LabelText(
                          label: "عندي حساب بالفعل",
                          color: AppTheme.blackTextColor.withOpacity(.75),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
