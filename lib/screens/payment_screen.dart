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
          label: "وسيلة الدفع",
          color: AppTheme.blackTextColor.withOpacity(.75),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          PaymentShape(
            image: "https://www.nerdwallet.com/assets/blog/wp-content/uploads/2019/07/credit-cards-4-steps-1920x1152.jpg",
            label: "بطاقة الائتمان",
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
            image: "https://economictimes.indiatimes.com/thumb/msid-83058184,width-1200,height-900,resizemode-4,imgsize-47252/cod-istock.jpg",
            label: "الدفع عند الاستلام",
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
