import 'package:apco_app/constant/app_constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [AppConstant.boxShadow],
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/icons/app_icon_round_1.0.png",
                    ),
                  ),
                ),
                //child: Image.asset("assets/icons/app_icon_round_1.0.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
