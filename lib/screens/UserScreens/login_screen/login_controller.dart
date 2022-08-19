
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';

class LoginController extends GetxController {
  bool Loading = false;
  GlobalKey<FormState> Form = GlobalKey<FormState>();

  get loading => Loading;
  get form => Form;

  setLoading(bool loading){
    loading = Loading;
    update();
  }

  checkLoginUser(String phone, String password){
   Form.currentState!.validate() ?
   phone.contains("22222222222") ? Get.to(const HomeTechincalMainScreen()) : Get.to(const HomeMainScreen()) : null;

  }
}