import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_messages.dart';
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
                label: "${AppMessages.creditPageTitle}",
                color: AppTheme.blackTextColor.withOpacity(.75),
              ),
            ),
            CreditCardForm(
              onCreditCardModelChange: (CreditCardModel data) {},
              cardNumber: "${AppConstant.cardModel.cardNumber}",
              expiryDate: "${AppConstant.cardModel.expiryDate}",
              cardHolderName: "${AppConstant.cardModel.cardHolderName}",
              cvvCode: "${AppConstant.cardModel.cvvCode}",
              obscureCvv: true,
              obscureNumber: true,
              themeColor: AppTheme.transparentColor,
              textColor: AppTheme.blackTextColor,
              cursorColor: AppTheme.mainColor,
              formKey: formKey,
              numberValidationMessage: "${AppMessages.numberValidationMessage}",
              dateValidationMessage: "${AppMessages.dateValidationMessage}",
              cvvValidationMessage: "${AppMessages.cvvValidationMessage}",
              cardNumberDecoration: AppConstant.inputDecoration(
                labelText: "${AppMessages.numberLabelText}",
                hintText: "${AppMessages.numberHintText}",
              ),
              expiryDateDecoration: AppConstant.inputDecoration(
                labelText: "${AppMessages.dateLabelText}",
                hintText: "${AppMessages.dateHintText}",
              ),
              cvvCodeDecoration: AppConstant.inputDecoration(
                labelText: "${AppMessages.cvvLabelText}",
                hintText: "${AppMessages.cvvHintText}",
              ),
              cardHolderDecoration: AppConstant.inputDecoration(
                labelText: "${AppMessages.cardHolderLabelText}",
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
            CardWidget(),
            CardWidget(),
            CardWidget(),
          ],
        ),
      ),
    );
  }
}
