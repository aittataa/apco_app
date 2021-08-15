import 'package:apco_app/models/categories.dart';
import 'package:apco_app/models/meal.dart';
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
      meals: [
        Meal(
          id: 1,
          label: "سيزر (دجاج)",
          picture: "https://dlwaqty.com/storage/11964/-سلاد-بالفراخ-e1530463904152.jpg",
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 2,
          label: "فتوش",
          picture: "https://www.taabkh.com/files/recipe/2020/06/Fattoush-restaurants.jpg",
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 3,
          label: "كينوا",
          picture: 'https://kitchen.sayidaty.net/uploads/node_gallery/kinwa-salad.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 4,
          label: "جريك",
          picture: 'https://elwasfa.com/wp-content/uploads/2017/09/IMG_3395.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 5,
          label: "بنجر",
          picture: 'https://modo3.com/thumbs/fit630x300/22287/1427107264/تحضير_سلطة_الشمندر.jpg',
          price: 4.99,
          description: '',
        ),
      ],
    ),
    Categories(
      id: 1,
      label: "المقبلات",
      picture: "https://i.ytimg.com/vi/eUqPl9q2gTY/maxresdefault.jpg",
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "حمص",
          picture: 'https://i.ytimg.com/vi/xbJF8eNxW6k/maxresdefault.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 2,
          label: "بطاطس ودجز",
          picture: 'https://kitchen.sayidaty.net/uploads/small/9c/9ca3f2e678cc14d5e0bf08c91ea70230_w750_h750.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 3,
          label: "بطاطس مقلية",
          picture: 'https://modo3.com/thumbs/fit630x300/146392/1480162729/عمل_بطاطا_مقلية_لذيذة.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 4,
          label: "فتة حمص",
          picture: 'https://modo3.com/thumbs/fit630x300/102052/1471355375/كيفية_عمل_فتة_الحمص.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 5,
          label: "فتة باذنجان",
          picture: 'https://www.tareekaa.com/wp-content/uploads/2020/07/فتة-باذنجان-باللبن-600x430.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 6,
          label: "ورق عنب",
          picture: 'https://www.hiamag.com/sites/default/files/styles/ph2_960_600/public/recipe/9603586-507372097.jpg',
          price: 4.99,
          description: '',
        ),
      ],
    ),
    Categories(
      id: 1,
      label: "السندوتشات",
      picture: "https://www.supermama.me/system/App/Entities/Recipe/images/000/104/366/watermarked/سندوتشات-كودو.jpg",
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "حلومي (راب / بريس)",
          picture: 'https://chatfood.imgix.net/static/casper-and-gambini-s-ksa/menu/halloumi-wrap_1588710396.jpeg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 2,
          label: "كلوب ساندوتش (دجاج / تركي)",
          picture: 'https://shamlola.s3.amazonaws.com/Shamlola_Images/5/src/62cc45ddf4054f3fad7dc22e6c5b95022d86723b.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 3,
          label: "لبنه",
          picture: 'https://kitchen.sayidaty.net/uploads/small/6e/6e235b9eeb3246b8c4cef1f5c599ed0c_w750_h750.png',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 4,
          label: "تونه",
          picture: 'https://shamlola.s3.amazonaws.com/Shamlola_Images/8/src/9d3830623af29fd37f327be02f846ecd1da180db.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 5,
          label: "فيتا",
          picture: 'https://img-global.cpcdn.com/recipes/de152230ac5e2473/1200x630cq70/photo.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 6,
          label: "برجر (لحم / دجاج)",
          picture: 'https://www.almrsal.com/wp-content/uploads/2016/09/همبرجر.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 7,
          label: "هوت دوج",
          picture: 'https://shamlola.s3.amazonaws.com/Shamlola_Images/8/src/00f886ab846c37889fa2047be81905bb9894f196.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 8,
          label: "دراجون تشكن",
          picture: 'https://b.zmtcdn.com/data/dish_photos/a6e/c4d1375ed8f103aef45453eb24f49a6e.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 9,
          label: "فيليه ستيك",
          picture: 'https://kitchen.sayidaty.net/uploads/small/b1/b16e961f5d0f239420bb96824fa9c071_w750_h500.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 10,
          label: "شاورما راب",
          picture: 'https://i.ytimg.com/vi/J55gry4Baaw/maxresdefault.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 11,
          label: "شكشوكه",
          picture: 'https://i.ytimg.com/vi/IR9DxVfGMqA/maxresdefault.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 12,
          label: "جبنه",
          picture: 'http://aklat.net/foods/185/13160-white-cheese-sandwich.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 13,
          label: "جبنه ومربى",
          picture: 'https://dlwaqty.com/storage/31229/6e235b9eeb3246b8c4cef1f5c599ed0c_w750_h500.png',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 14,
          label: "بيض مسلوق",
          picture: 'https://img.atyabtabkha.com/LUa9AwQqILT6GRDZ1ml0OTZGAEk=/640x360/https://harmony-assets-live.s3.amazonaws.com/image_source/8c/e9/8ce9ec0803946b63bb6531793d87938e68b370a0.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 15,
          label: "اومليت",
          picture: 'https://images.food52.com/WCyN-JFB07GdgvnFKIRPQ4TBiQo=/1200x1200/267de482-443b-4511-8637-b08fb66ed64c--2019-1106_indian-railway-omelet-recipe_3x2_julia-gartland_297.jpg',
          price: 4.99,
          description: '',
        ),
      ],
    ),
    Categories(
      id: 1,
      label: "المعجنات (أسمر / أبيض)",
      picture: "https://blog.mumzworld.com/wp-content/uploads/2020/10/أفكار-معجنات-باستخدام-عجينة-العشر-دقائق.jpg",
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "زعتر",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 2,
          label: "جبنه",
          picture: 'https://kms.sohati.com/Images/998x749xo/cheese-fatayer-620x325.jpg',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 3,
          label: "زعتر وجبنه",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 4,
          label: "لبنه وعسل",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 5,
          label: "لبنه وزعتر",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 6,
          label: "مايتي كفته",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 7,
          label: "بيتزا (خضار / بيبروني / مارجريتا / تشكن باربكيو صوص)",
          picture: '',
          price: 4.99,
          description: '',
        ),
      ],
    ),
    Categories(
      id: 1,
      label: "الحلويات",
      picture: "https://www.zyadda.com/wp-content/uploads/2020/12/CrxnALOXEAA4Q7Z-1062x580.jpg",
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "غرانولا يوجرت",
          picture: '',
          price: 4.99,
          description: '',
        ),
      ],
    ),
    Categories(
      id: 1,
      label: "العصيرات",
      picture: "https://cdn.al-ain.com/images/2019/4/09/47-110620-benefits-juices-ramadan-drinks-recipes-2.jpeg",
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "برتقال",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 2,
          label: "موز بالحليب",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 3,
          label: "جزر",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 4,
          label: "مشروبات غازية",
          picture: '',
          price: 4.99,
          description: '',
        ),
      ],
    ),
    Categories(
      id: 1,
      label: "الأطباق الرئيسية",
      picture: "https://www.justfood.tv//big/0chickenbasil.jpg",
      description: "description",
      meals: [
        Meal(
          id: 1,
          label: "رز بخاري",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 2,
          label: "رز بالحمص",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 3,
          label: "كشري",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 4,
          label: "كابلي",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 5,
          label: "بريك مديني",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 6,
          label: "عيش باللحم",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 7,
          label: "مكرونة بشميل (دجاج / لحم)",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 8,
          label: "لازانيا",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 9,
          label: "كبة صينيه",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 10,
          label: "كفتة",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 11,
          label: "بطاطس بوريه بالمفروم",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 12,
          label: "لفائف التوست بالدجاج",
          picture: '',
          price: 4.99,
          description: '',
        ),
        Meal(
          id: 13,
          label: "كرات البطاطس بالكريمة",
          picture: '',
          price: 4.99,
          description: '',
        ),
      ],
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
