
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_main_screen/home_main_screen.dart';

class RequestMyServiceController extends GetxController {

  GlobalKey<FormState> _form = GlobalKey<FormState>();

  GlobalKey<FormState> get from => _form;

  sendRequestService(){
    from.currentState!.validate() ? Get.to(const HomeMainScreen()) : null;
  }
}