import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/button_click.dart';
import 'package:apco_app/widgets/card_widget.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backColor,
      animationDuration: AppConstant.duration,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: SizedBox(
        height: AppConstant.screenHeight * .9,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ListTile(
              title: LabelText(
                label: "تاكيد بطاقة الائتمان",
                color: AppTheme.blackTextColor.withOpacity(.75),
              ),
            ),
            CreditCardForm(
              onCreditCardModelChange: (CreditCardModel data) {},
              cardNumber: "0000 0000 0000 0000",
              expiryDate: "MM/YY",
              cardHolderName: "Mr. John Doe",
              cvvCode: "000",
              obscureCvv: true,
              obscureNumber: true,
              themeColor: AppTheme.transparentColor,
              textColor: AppTheme.blackTextColor,
              cursorColor: AppTheme.mainColor,
              formKey: formKey,
              numberValidationMessage: "Invalid Account Number",
              dateValidationMessage: "Invalid Date",
              cvvValidationMessage: "Invalid CVV",
              cardNumberDecoration: AppConstant.inputDecoration(
                labelText: "Account Number",
                hintText: "0000 0000 0000 0000",
              ),
              expiryDateDecoration: AppConstant.inputDecoration(
                labelText: "Expired Date",
                hintText: "MM/YY",
              ),
              cvvCodeDecoration: AppConstant.inputDecoration(
                labelText: "CVV",
                hintText: "●●●●",
              ),
              cardHolderDecoration: AppConstant.inputDecoration(
                labelText: "Card Holder",
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              minVerticalPadding: 1,
              title: ButtonClick(
                label: "تاكيد",
                textColor: AppTheme.whiteTextColor,
                backColor: AppTheme.mainColor,
              ),
            ),
            CardWidget(),
            CardWidget(),
            CardWidget(),
          ],
        ),
      ),
    );
  }
}
