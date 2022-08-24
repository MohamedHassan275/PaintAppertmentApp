
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';

class RequestServiceController extends GetxController {

  GlobalKey<FormState> _form = GlobalKey<FormState>();

  GlobalKey<FormState> get from => _form;

  sendRequestService(){
    from.currentState!.validate() ? Get.to(const HomeMainScreen()) : null;
  }
 }