import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "5500 0000 0000 0000",
      expiryDate: "07/24",
      cardHolderName: "Mr. John Doe",
      cvvCode: "●●●●",
      showBackView: false,
      animationDuration: AppConstant.duration,
      height: 150,
      textStyle: TextStyle(
        color: AppTheme.whiteTextColor,
        fontWeight: FontWeight.w900,
      ),
      obscureCardNumber: true,
      obscureCardCvv: true,
    );
  }
}
