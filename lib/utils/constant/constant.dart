
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain_appertment/utils/constant/Themes.dart';


class AppConstants {
  // Api Endpoints
  static const String baseUrl = 'https://halal-location.germaniatek.co/';

  static const  String URL = 'https://nebny.net/api/v2/';
  static const String logout = 'are you logout in the application';
  static const String apiUrl = "http://bneksy.first-meeting.net/api/";
  static const String categoriesImagesUrl =
      "http://bneksy.first-meeting.net/images/categories";
  static const String productImagesUrl =
      "http://bneksy.first-meeting.net/images/products";
  static const String userImagesUrl = "http://bneksy.first-meeting.net/images/users/";
  static const String appTitle = "Bneksy";
  static const String fontFamily = "cairo";
  static const Map rates = {
    0: "سيئ جدا",
    1: "سيئ جدا",
    2: "سيئ",
    3: "جيد",
    4: "جيد جداً",
    5: "ممتاز",
  };


  static void customFlutterToast(msg){
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 15,
      backgroundColor: Themes.whiteColor,
      gravity: ToastGravity.BOTTOM,
      textColor: Themes.ColorApp1,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

}


