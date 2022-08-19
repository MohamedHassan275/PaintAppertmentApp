
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_order.dart';
import 'package:pain_appertment/screens/UserScreens/setting_screen/setting_screen.dart';

import '../../../utils/constant/Themes.dart';
import '../home_screen/home_screen.dart';
import '../request_service_screen/request_service_screen.dart';

class HomeMainController extends GetxController{
  int index = 0;
  List<Widget> navigationItem = [const HomeScreen() , const MyOrder(), const RequestServiceScreen(),const SettingScreen()];

  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    BottomNavigationBarItem(icon: Image.asset(Assets.imagesIconHome2,width: 30,height: 30,color: Themes.ColorApp11),label: 'home'.tr,
    activeIcon: Image.asset(Assets.imagesIconHome2,width: 30,height: 30,color: Themes.ColorApp1)),

    BottomNavigationBarItem(icon: Image.asset(Assets.imagesMyOrderHome,width: 30,height: 30),label: 'my_order'.tr,
        activeIcon: Image.asset(Assets.imagesMyOrderHome2,width: 30,height: 30)),

    BottomNavigationBarItem(icon: Image.asset(Assets.imagesOrderPriceImage,width: 30,height: 30,color:  Themes.ColorApp11,),label: 'request_order_company'.tr,
        activeIcon: Image.asset(Assets.imagesOrderPriceImage,width: 30,height: 30,color:  Themes.ColorApp10,)),

    BottomNavigationBarItem(icon: Image.asset(Assets.imagesSettingHomeIcon,width: 30,height: 30,color: Themes.ColorApp11),label: 'setting'.tr,
        activeIcon: Image.asset(Assets.imagesSettingHomeIcon,width: 30,height: 30,color: Themes.ColorApp1)),
  ];
}