import 'package:apco_app/constant/app_messages.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/credit_page.dart';
import 'package:apco_app/widgets/delivery_page.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/payment_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        centerTitle: true,
        title: LabelText(
          label: "${AppMessages.paymentTitle}",
          color: AppTheme.blackTextColor.withOpacity(.75),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          PaymentShape(
            image: "${AppMessages.creditIcon}",
            label: "${AppMessages.creditTitle}",
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CreditPage();
                },
              );
            },
          ),
          PaymentShape(
            image: "${AppMessages.deliveryIcon}",
            label: "${AppMessages.deliveryTitle}",
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return DeliveryPage();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
