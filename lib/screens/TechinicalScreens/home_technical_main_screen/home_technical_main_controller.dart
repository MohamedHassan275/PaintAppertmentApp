
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_screen/home_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/setting_technical_screen/setting_technical_screen.dart';

import '../../../utils/constant/Themes.dart';
import '../order_technical_screen/current_order_technical_screen/current_order_technical_screen.dart';
import '../order_technical_screen/new_order_technical_screen/new_order_technical_screen.dart';
import '../order_technical_screen/previous_order_technical_screen/previous_order_technical_screen.dart';

class HomeTechincalMainController extends GetxController {
  bool Loading = false;
  int index = 0;
  get loading => Loading;

  setLoading(bool loading){
    loading = this.Loading;
    update();
  }

  List<Widget> screenList = [const NewOrderTechnicalScreen(), const CurrentOrderTechnicalScreen(), const PreviousOrderTechnicalScreen(), const SettingTechnicalScreen()];
 // List<Widget> screenList = [const CurrentOrderTechnicalScreen(), const CurrentOrderTechnicalScreen(), const PreviousOrderTechnicalScreen(), const SettingTechnicalScreen()];

  List<BottomNavigationBarItem> navigationList = [
    // BottomNavigationBarItem(label: 'home'.tr,icon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),
    //   activeIcon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),),
    BottomNavigationBarItem(label: 'my_new_order'.tr,icon: Image.asset(Assets.imagesMyOrderHome,width: 30,height: 30),
      activeIcon: Image.asset(Assets.imagesMyOrderHome2,width: 30,height: 30),),

    BottomNavigationBarItem(label: 'my_active_current'.tr,icon: Image.asset(Assets.imagesMyOrderHome,width: 30,height: 30),
      activeIcon: Image.asset(Assets.imagesMyOrderHome2,width: 30,height: 30),),

    BottomNavigationBarItem(label: 'my_previous_requests'.tr,icon: Image.asset(Assets.imagesMyOrderHome,width: 30,height: 30),
      activeIcon: Image.asset(Assets.imagesMyOrderHome2,width: 30,height: 30),),

    BottomNavigationBarItem(label: 'setting'.tr,icon: Image.asset(Assets.imagesSettingHomeIcon,width: 30,height: 30,color: Themes.ColorApp11),
      activeIcon: Image.asset(Assets.imagesSettingHomeIcon,width: 30,height: 30,color: Themes.ColorApp1),),

  ];

}