import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/screens/home_screen.dart';
import 'package:apco_app/screens/register_screen.dart';
import 'package:apco_app/widgets/button_click.dart';
import 'package:apco_app/widgets/expanded_logo.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/social_button.dart';
import 'package:apco_app/widgets/text_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 1.5,
                      title: TextBox(
                        controller: TextEditingController(),
                        hint: "البريد الإلكتروني",
                        icon: CupertinoIcons.mail_solid,
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
                        onChanged: (value) {
                          print(value);
                        },
                        controller: TextEditingController(),
                        hint: "كلمة المرور",
                        icon: CupertinoIcons.lock_shield_fill,
                        obscureText: !false,
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: !true ? AppTheme.blackIconColor.withOpacity(.25) : AppTheme.lightMainColor,
                        ),
                      ),
                    ),
                    ListTile(
                      title: LabelText(
                        label: "هل نسيت كلمة السر؟",
                        color: AppTheme.blackTextColor.withOpacity(.75),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    ListTile(
                      title: ButtonClick(
                        label: "تسجيل الدخول",
                        textColor: AppTheme.whiteTextColor,
                        backColor: AppTheme.mainColor,
                        onPressed: () => Get.offAll(() => HomeScreen()),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(10),
                      minVerticalPadding: 1.5,
                      title: LabelText(
                        label: "قم بالتسجيل عبر",
                        color: AppTheme.blackTextColor.withOpacity(.75),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 10,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SocialButton(
                                  image: "assets/images/facebook.png",
                                  color: AppTheme.facebookColor,
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox(width: 1)),
                            Expanded(
                              flex: 10,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: SocialButton(
                                  image: "assets/images/google.png",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.off(() => RegisterScreen()),
                      title: LabelText(
                        label: "انشاء حساب جديد",
                        color: AppTheme.blackTextColor.withOpacity(.75),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
