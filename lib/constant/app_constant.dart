import 'dart:math';

import 'package:apco_app/constant/app_theme.dart';
import 'package:apco_app/models/categories.dart';
import 'package:apco_app/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstant {
  static int itemIndex = 0; //Random().nextInt(7);
  static const Duration duration = Duration(milliseconds: 1500);
  static const Curve curve = Curves.linearToEaseOut;
  static final double screenWidth = Get.size.width;
  static final double screenHeight = Get.size.height;

  // static setMeal(Meal meal) async {
  //   var database = await Hive.openBox("${meal.id}");
  //   database.add(meal);
  // }

  // static getMeal(Meal meal) async {
  //   var database = await Hive.openBox("${meal.id}");
  //   return database.getAt(0);
  // }

  static gridDelegate({int crossAxisCount = 1, double childAspectRatio = 1, double spacing = 0}) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
    );
  }

  static inputDecoration({String labelText = "", String hintText = ""}) {
    return InputDecoration(
      labelText: "$labelText",
      hintText: "$hintText",
      labelStyle: TextStyle(
        color: AppTheme.mainColor,
        fontWeight: FontWeight.w900,
      ),
      hintStyle: TextStyle(
        color: AppTheme.blackTextColor.withOpacity(.5),
        fontWeight: FontWeight.bold,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1.5, color: AppTheme.lightMainColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 2.5, color: AppTheme.lightMainColor),
      ),
    );
  }

  static get mealRate {
    Random random = Random();
    int max = 4;
    int min = 1;
    return (random.nextDouble() * (max - min + 1)) + min;
  }

  static get mealTime {
    int value = Random().nextInt(10);
    if (value <= 1) {
      return (value + 2) * 5;
    } else {
      return (value) * 5;
    }
  }

  static const boxShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 10,
    spreadRadius: 0.1,
  );

  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception("Couldn't Launch $url");
    }
  }

  static List<Categories> menuList = [
    Categories(
      id: 1,
      label: "السلطات",
      picture: "https://www.onceuponachef.com/images/2019/07/Big-Italian-Salad.jpg",
      rate: AppConstant.mealRate,
      time: AppConstant.mealTime,
      description: "",
      meals: [
        Meal(
          id: 1,
          label: "سيزر (دجاج)",
          picture: "https://dlwaqty.com/storage/11964/-سلاد-بالفراخ-e1530463904152.jpg",
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 2,
          label: "فتوش",
          picture: "https://www.taabkh.com/files/recipe/2020/06/Fattoush-restaurants.jpg",
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 3,
          label: "كينوا",
          picture: 'https://kitchen.sayidaty.net/uploads/node_gallery/kinwa-salad.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 4,
          label: "جريك",
          picture: 'https://elwasfa.com/wp-content/uploads/2017/09/IMG_3395.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 5,
          label: "بنجر",
          picture: 'https://modo3.com/thumbs/fit630x300/22287/1427107264/تحضير_سلطة_الشمندر.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
      ]..sort((a, b) => b.id.compareTo(a.id)),
    ),
    Categories(
      id: 2,
      label: "المقبلات",
      picture: "https://i.ytimg.com/vi/eUqPl9q2gTY/maxresdefault.jpg",
      rate: AppConstant.mealRate,
      time: AppConstant.mealTime,
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "حمص",
          picture: 'https://i.ytimg.com/vi/xbJF8eNxW6k/maxresdefault.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 2,
          label: "بطاطس ودجز",
          picture: 'https://kitchen.sayidaty.net/uploads/small/9c/9ca3f2e678cc14d5e0bf08c91ea70230_w750_h750.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 3,
          label: "بطاطس مقلية",
          picture: 'https://modo3.com/thumbs/fit630x300/146392/1480162729/عمل_بطاطا_مقلية_لذيذة.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 4,
          label: "فتة حمص",
          picture: 'https://modo3.com/thumbs/fit630x300/102052/1471355375/كيفية_عمل_فتة_الحمص.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 5,
          label: "فتة باذنجان",
          picture: 'https://www.tareekaa.com/wp-content/uploads/2020/07/فتة-باذنجان-باللبن-600x430.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 6,
          label: "ورق عنب",
          picture: 'https://www.hiamag.com/sites/default/files/styles/ph2_960_600/public/recipe/9603586-507372097.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
      ]..sort((a, b) => b.id.compareTo(a.id)),
    ),
    Categories(
      id: 3,
      label: "السندوتشات",
      picture: "https://www.supermama.me/system/App/Entities/Recipe/images/000/104/366/watermarked/سندوتشات-كودو.jpg",
      rate: AppConstant.mealRate,
      time: AppConstant.mealTime,
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "حلومي (راب / بريس)",
          picture: 'https://chatfood.imgix.net/static/casper-and-gambini-s-ksa/menu/halloumi-wrap_1588710396.jpeg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 2,
          label: "كلوب ساندوتش (دجاج / تركي)",
          picture: 'https://shamlola.s3.amazonaws.com/Shamlola_Images/5/src/62cc45ddf4054f3fad7dc22e6c5b95022d86723b.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 3,
          label: "لبنه",
          picture: 'https://kitchen.sayidaty.net/uploads/small/6e/6e235b9eeb3246b8c4cef1f5c599ed0c_w750_h750.png',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 4,
          label: "تونه",
          picture: 'https://shamlola.s3.amazonaws.com/Shamlola_Images/8/src/9d3830623af29fd37f327be02f846ecd1da180db.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 5,
          label: "فيتا",
          picture: 'https://img-global.cpcdn.com/recipes/de152230ac5e2473/1200x630cq70/photo.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 6,
          label: "برجر (لحم / دجاج)",
          picture: 'https://www.almrsal.com/wp-content/uploads/2016/09/همبرجر.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 7,
          label: "هوت دوج",
          picture: 'https://shamlola.s3.amazonaws.com/Shamlola_Images/8/src/00f886ab846c37889fa2047be81905bb9894f196.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 8,
          label: "دراجون تشكن",
          picture: 'https://b.zmtcdn.com/data/dish_photos/a6e/c4d1375ed8f103aef45453eb24f49a6e.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 9,
          label: "فيليه ستيك",
          picture: 'https://kitchen.sayidaty.net/uploads/small/b1/b16e961f5d0f239420bb96824fa9c071_w750_h500.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 10,
          label: "شاورما راب",
          picture: 'https://i.ytimg.com/vi/J55gry4Baaw/maxresdefault.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 11,
          label: "شكشوكه",
          picture: 'https://i.ytimg.com/vi/IR9DxVfGMqA/maxresdefault.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 12,
          label: "جبنه",
          picture: 'http://aklat.net/foods/185/13160-white-cheese-sandwich.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 13,
          label: "جبنه ومربى",
          picture: 'https://dlwaqty.com/storage/31229/6e235b9eeb3246b8c4cef1f5c599ed0c_w750_h500.png',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 14,
          label: "بيض مسلوق",
          picture: 'https://img.atyabtabkha.com/LUa9AwQqILT6GRDZ1ml0OTZGAEk=/640x360/https://harmony-assets-live.s3.amazonaws.com/image_source/8c/e9/8ce9ec0803946b63bb6531793d87938e68b370a0.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 15,
          label: "اومليت",
          picture: 'https://images.food52.com/WCyN-JFB07GdgvnFKIRPQ4TBiQo=/1200x1200/267de482-443b-4511-8637-b08fb66ed64c--2019-1106_indian-railway-omelet-recipe_3x2_julia-gartland_297.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
      ]..sort((a, b) => b.id.compareTo(a.id)),
    ),
    Categories(
      id: 4,
      label: "المعجنات (أسمر / أبيض)",
      picture: "https://blog.mumzworld.com/wp-content/uploads/2020/10/أفكار-معجنات-باستخدام-عجينة-العشر-دقائق.jpg",
      rate: AppConstant.mealRate,
      time: AppConstant.mealTime,
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "زعتر",
          picture: 'https://modo3.com/thumbs/fit630x300/161847/1522676759/عمل_معجنات_الزعتر_الأخضر.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 2,
          label: "جبنه",
          picture: 'https://kms.sohati.com/Images/998x749xo/cheese-fatayer-620x325.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 3,
          label: "زعتر وجبنه",
          picture: 'https://modo3.com/thumbs/fit630x300/200489/1540447153/طريقة_عمل_فطائر_الجبن_والزعتر.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 4,
          label: "لبنه وعسل",
          picture: 'https://ellearabia.com/media/cache/article_thumbnail_desktop/files/cms/standalone-content/thumbnail/5a8dc6265786e.png',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 5,
          label: "لبنه وزعتر",
          picture: 'https://i.ytimg.com/vi/mcxB837TtFA/maxresdefault.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 6,
          label: "مايتي كفته",
          picture: 'https://dubaitop1.com/wp-content/uploads/2019/11/مطعم-زعتر-و-زيت.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 7,
          label: "بيتزا (خضار / بيبروني / مارجريتا / تشكن باربكيو صوص)",
          picture: 'https://jahed.net/wp-content/uploads/2020/07/Barbecue-chicken-pizza.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
      ]..sort((a, b) => b.id.compareTo(a.id)),
    ),
    Categories(
      id: 5,
      label: "الحلويات",
      picture: "https://www.zyadda.com/wp-content/uploads/2020/12/CrxnALOXEAA4Q7Z-1062x580.jpg",
      rate: AppConstant.mealRate,
      time: AppConstant.mealTime,
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "غرانولا يوجرت",
          picture: 'https://kitchen.sayidaty.net/uploads/small/e7/e7bc187b49d56d0b782cff2c2625d64d_w750_h750.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
      ]..sort((a, b) => b.id.compareTo(a.id)),
    ),
    Categories(
      id: 6,
      label: "العصيرات",
      picture: "https://cdn.al-ain.com/images/2019/4/09/47-110620-benefits-juices-ramadan-drinks-recipes-2.jpeg",
      rate: AppConstant.mealRate,
      time: AppConstant.mealTime,
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "برتقال",
          picture: 'https://img.youm7.com/ArticleImgs/2019/5/9/85808-فوائد-عصير-البرتقال-2.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 2,
          label: "موز بالحليب",
          picture: 'https://www.justfood.tv/big/0banana.walnut.milkshake.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 3,
          label: "جزر",
          picture: 'https://fortnite-plus.com/wp-content/uploads/2018/12/987987-780x405.png',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 4,
          label: "مشروبات غازية",
          picture: 'https://tijaratuna.com/wp-content/uploads/2021/06/صناعة-المشروبات-الغازية-مكونات-المشروبات-الغازية.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
      ]..sort((a, b) => b.id.compareTo(a.id)),
    ),
    Categories(
      id: 7,
      label: "الأطباق الرئيسية",
      picture: "https://www.justfood.tv//big/0chickenbasil.jpg",
      rate: AppConstant.mealRate,
      time: AppConstant.mealTime,
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "رز بخاري",
          picture: 'https://i.ytimg.com/vi/zk0hm4ZHhjg/maxresdefault.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 2,
          label: "رز بالحمص",
          picture: 'https://www.tareekaa.com/wp-content/uploads/2018/05/رز-بالحمص.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 3,
          label: "كشري",
          picture: 'https://kitchen.sayidaty.net/uploads/small/e8/e897d354a069587cbd51689ffa2d5139_w750_h500.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 4,
          label: "كابلي",
          picture: 'https://www.tareekaa.com/wp-content/uploads/2018/10/الرز-الكابلي-الحجازي-1.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 5,
          label: "بريك مديني",
          picture: 'https://i.ytimg.com/vi/3ODKgyzxS40/maxresdefault.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 6,
          label: "عيش باللحم",
          picture: 'https://womenss.net/wp-content/uploads/2019/12/7095.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 7,
          label: "مكرونة بشميل (دجاج / لحم)",
          picture: 'https://www.justfood.tv/big/0Bashamel.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 8,
          label: "لازانيا",
          picture: 'https://kitchen.sayidaty.net/uploads/small/00/006275c543928839aa3f57e28129e894_w750_h750.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 9,
          label: "كبة صينيه",
          picture: 'https://keyfpro.com/wp-content/uploads/2020/07/الكبة-بالصينية-على-الطريقة-السورية.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 10,
          label: "كفتة",
          picture: 'https://www.justfood.tv/UserFiles/000%20(1)-82-1.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 11,
          label: "بطاطس بوريه بالمفروم",
          picture: 'https://modo3.com/thumbs/fit630x300/167331/1488814509/بطاطا_بوريه_باللحمة_المفرومة.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 12,
          label: "لفائف التوست بالدجاج",
          picture: 'https://www.hiamag.com/sites/default/files/styles/ph2_960_600/public/recipe/5712381-129373209.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
        Meal(
          id: 13,
          label: "كرات البطاطس بالكريمة",
          picture: 'https://wasfetmama.com/wp-content/uploads/2020/02/صينية-كرات-البطاطس-بالدجاج-والكريمه.jpg',
          price: 4.99,
          rate: AppConstant.mealRate,
          time: AppConstant.mealTime,
          description: '',
        ),
      ]..sort((a, b) => b.id.compareTo(a.id)),
    ),
  ]..sort((a, b) => b.id.compareTo(a.id));
}
