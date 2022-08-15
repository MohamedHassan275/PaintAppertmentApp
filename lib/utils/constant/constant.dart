
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pain_appertment/utils/constant/Themes.dart';

const  String URL = 'https://nebny.net/api/v2/';
const String logout = 'are you logout in the application';
const String apiUrl = "http://bneksy.first-meeting.net/api/";
const String categoriesImagesUrl =
    "http://bneksy.first-meeting.net/images/categories";
const String productImagesUrl =
    "http://bneksy.first-meeting.net/images/products";
const String userImagesUrl = "http://bneksy.first-meeting.net/images/users/";
const String appTitle = "Bneksy";
const String fontFamily = "cairo";
const Map rates = {
  0: "سيئ جدا",
  1: "سيئ جدا",
  2: "سيئ",
  3: "جيد",
  4: "جيد جداً",
  5: "ممتاز",
};

void CustomFlutterToast(msg){
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