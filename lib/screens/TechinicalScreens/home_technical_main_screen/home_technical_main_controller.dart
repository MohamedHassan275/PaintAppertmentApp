
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/screens/TechinicalScreens/current_order_technical_screen/current_order_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_screen/home_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/previous_order_technical_screen/previous_order_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/setting_technical_screen/setting_technical_screen.dart';
import 'package:pain_appertment/screens/UserScreens/setting_screen/setting_screen.dart';

import '../../../utils/constant/Themes.dart';

class HomeTechincalMainController extends GetxController {
  bool Loading = false;
  int index = 0;
  get loading => Loading;

  setLoading(bool loading){
    loading = this.Loading;
    update();
  }

  List<Widget> screenList = [const HomeTechnicalScreen(), const CurrentOrderTechnicalScreen(), const PreviousOrderTechnicalScreen(), const SettingTechnicalScreen()];

  List<BottomNavigationBarItem> navigationList = [
    BottomNavigationBarItem(label: 'home'.tr,icon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),
      activeIcon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),),

    BottomNavigationBarItem(label: 'home'.tr,icon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),
      activeIcon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),),

    BottomNavigationBarItem(label: 'home'.tr,icon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),
      activeIcon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),),

    BottomNavigationBarItem(label: 'home'.tr,icon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),
      activeIcon: Image.asset(Assets.imagesFactoryNamIcon,width: 30,height: 30,color: Themes.ColorApp11),),

  ];

}