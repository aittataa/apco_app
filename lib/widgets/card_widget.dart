import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "${AppConstant.cardModel.cardNumber}",
      expiryDate: "${AppConstant.cardModel.expiryDate}",
      cardHolderName: "${AppConstant.cardModel.cardHolderName}",
      cvvCode: "${AppConstant.cardModel.cvvCode}",
      showBackView: false,
      animationDuration: AppConstant.duration,
      height: 200,
      textStyle: TextStyle(
        color: AppTheme.whiteTextColor,
        fontWeight: FontWeight.w900,
        fontSize: 20,
      ),
      obscureCardNumber: true,
      obscureCardCvv: true,
    );
  }
}
