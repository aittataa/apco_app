import 'package:apco_app/constant/app_constant.dart';
import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/widgets/back_icon.dart';
import 'package:apco_app/widgets/label_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        title: Text(
          "وسيلة الدفع",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.blackTextColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              PaymentShape(
                image: "https://www.nerdwallet.com/assets/blog/wp-content/uploads/2019/07/credit-cards-4-steps-1920x1152.jpg",
                label: "بطاقة الائتمان",
                onTap: () {
                  setState(() {
                    controller.jumpToPage(1);
                  });
                },
              ),
              PaymentShape(
                image: "https://economictimes.indiatimes.com/thumb/msid-83058184,width-1200,height-900,resizemode-4,imgsize-47252/cod-istock.jpg",
                label: "الدفع عند الاستلام",
                onTap: () {
                  setState(() {
                    controller.jumpToPage(2);
                  });
                },
              ),
            ],
          ),
          CreditPage(),
          DeliveryPage(),
        ],
      ),
    );
  }
}

class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}

class CreditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
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
