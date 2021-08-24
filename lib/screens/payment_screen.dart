import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/button_click.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:apco_app/widgets/text_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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
        title: Text(
          "وسيلة الدفع",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.blackTextColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
          ),
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

class CreditPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          physics: BouncingScrollPhysics(),
          children: [
            ListTile(
              title: Text(
                "تاكيد بطاقة الائتمان",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.blackTextColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            CreditCardForm(
              onCreditCardModelChange: (CreditCardModel data) {},
              cardNumber: "0000 0000 0000 0000",
              expiryDate: "MM/YY",
              cardHolderName: "Mr. John Doe",
              cvvCode: "000",
              obscureCvv: true,
              obscureNumber: false,
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
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              minVerticalPadding: 1.5,
              title: ButtonClick(
                label: "تاكيد",
                textColor: AppTheme.whiteTextColor,
                backColor: AppTheme.mainColor,
                onPressed: null, // () => Get.offAll(() => HomeScreen()),
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

class DeliveryPage extends StatelessWidget {
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
              title: Text(
                "تاكيد عنوان الاقامة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.blackTextColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            ListTile(
              title: TextBox(
                controller: TextEditingController(),
                hint: "عنوان الاقامة",
                icon: CupertinoIcons.house_alt_fill,
                keyboardType: TextInputType.text,
                suffixIcon: Icon(
                  true ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                  color: true ? AppTheme.lightMainColor : AppTheme.redIconColor,
                ),
              ),
            ),
            ListTile(
              title: TextBox(
                controller: TextEditingController(),
                hint: "الرمز البريدي",
                icon: CupertinoIcons.location_solid,
                keyboardType: TextInputType.number,
                suffixIcon: Icon(
                  true ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                  color: true ? AppTheme.lightMainColor : AppTheme.redIconColor,
                ),
              ),
            ),
            ListTile(
              title: TextBox(
                controller: TextEditingController(),
                hint: "المدينة",
                icon: CupertinoIcons.building_2_fill,
                keyboardType: TextInputType.text,
                suffixIcon: Icon(
                  true ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.clear_circled_solid,
                  color: true ? AppTheme.lightMainColor : AppTheme.redIconColor,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              minVerticalPadding: 1.5,
              title: ButtonClick(
                label: "تاكيد",
                textColor: AppTheme.whiteTextColor,
                backColor: AppTheme.mainColor,
                onPressed: null, // () => Get.offAll(() => HomeScreen()),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              title: Text(
                "أو",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.blackTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              title: ButtonClick(
                label: "الرياض - المملكة العربية السعودية",
                textColor: AppTheme.whiteTextColor,
                backColor: AppTheme.mainColor,
                onPressed: () async {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentShape extends StatelessWidget {
  final String image;
  final String label;
  final onTap;
  const PaymentShape({
    required this.image,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        boxShadow: [AppConstant.boxShadow],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero.copyWith(left: 10, right: 10),
        trailing: CircleAvatar(
          radius: 32,
          backgroundImage: CachedNetworkImageProvider("$image"),
        ),
        title: LabelText(
          label: "$label",
          textAlign: TextAlign.end,
        ),
        leading: Container(
          margin: EdgeInsets.all(5),
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.lightMainColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              CupertinoIcons.chevron_left_2,
              color: AppTheme.whiteIconColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "5500 0000 0000 0000",
      expiryDate: "07/24",
      cardHolderName: "Mr. John Doe",
      cvvCode: "000",
      showBackView: false,
      animationDuration: Duration(milliseconds: 1000),
      textStyle: TextStyle(
        color: AppTheme.whiteTextColor,
        fontWeight: FontWeight.w900,
        fontSize: 20,
      ),
      cardBgColor: Color(4279977083),
      obscureCardNumber: false,
      obscureCardCvv: false,
      labelCardHolder: "Mr. Doe John",
      labelExpiredDate: "07/24",
    );
  }
}
