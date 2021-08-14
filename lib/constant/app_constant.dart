import 'package:apco_app/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstant {
  static const appTitle = "APCO Restaurant";
  static const Duration duration = Duration(milliseconds: 1500);
  static const Curve curve = Curves.linearToEaseOut;

  static List categoriesList = [
    Categories(
      id: 1,
      label: "السلطات",
      picture: "https://www.onceuponachef.com/images/2019/07/Big-Italian-Salad.jpg",
      description: "",
      meals: [],
    ),
    Categories(
      id: 1,
      label: "المقبلات",
      picture: "https://i.ytimg.com/vi/eUqPl9q2gTY/maxresdefault.jpg",
      description: "description",
      meals: [],
    ),
    Categories(
      id: 1,
      label: "السندوتشات",
      picture: "https://www.supermama.me/system/App/Entities/Recipe/images/000/104/366/watermarked/سندوتشات-كودو.jpg",
      description: "description",
      meals: [],
    ),
    Categories(
      id: 1,
      label: "المعجنات (أسمر / أبيض)",
      picture: "https://blog.mumzworld.com/wp-content/uploads/2020/10/أفكار-معجنات-باستخدام-عجينة-العشر-دقائق.jpg",
      description: "description",
      meals: [],
    ),
    Categories(
      id: 1,
      label: "الحلويات",
      picture: "https://www.zyadda.com/wp-content/uploads/2020/12/CrxnALOXEAA4Q7Z-1062x580.jpg",
      description: "description",
      meals: [],
    ),
    Categories(
      id: 1,
      label: "العصيرات",
      picture: "https://cdn.al-ain.com/images/2019/4/09/47-110620-benefits-juices-ramadan-drinks-recipes-2.jpeg",
      description: "description",
      meals: [],
    ),
    Categories(
      id: 1,
      label: "الأطباق الرئيسية",
      picture: "https://www.justfood.tv//big/0chickenbasil.jpg",
      description: "description",
      meals: [],
    ),
  ];

  static gridDelegate({int crossAxisCount = 1, double childAspectRatio = 1}) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    );
  }

  static const boxShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 10,
    spreadRadius: 0.1,
  );

  ///Web Launcher
  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception("Couldn't Launch $url");
    }
  }
}
