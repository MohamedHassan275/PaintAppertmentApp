import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_screen/home_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/order_technical_screen/current_order_technical_screen/current_order_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/order_technical_screen/new_order_technical_screen/new_order_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/order_technical_screen/previous_order_technical_screen/previous_order_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/setting_technical_screen/setting_technical_screen.dart';

import '../../../generated/assets.dart';
import '../../../utils/constant/Themes.dart';

part 'home_main_technical_state.dart';

class HomeMainTechnicalCubit extends Cubit<HomeMainTechnicalState> {
  HomeMainTechnicalCubit() : super(HomeMainTechnicalInitial());

  static HomeMainTechnicalCubit get(BuildContext context) => BlocProvider.of(context);

  int index = 0;
  List<Widget> screenList = [
    const NewOrderTechnicalScreen(),
    const CurrentOrderTechnicalScreen(),
    const PreviousOrderTechnicalScreen(),
    const SettingTechnicalScreen()
  ];


  List<BottomNavigationBarItem> navigationList = [
    BottomNavigationBarItem(
      label: 'my_new_order'.tr,
      icon: Image.asset(Assets.imagesMyOrderHome, width: 30, height: 30),
      activeIcon: Image.asset(Assets.imagesMyOrderHome2, width: 30, height: 30),
    ),

    BottomNavigationBarItem(
      label: 'my_active_current'.tr,
      icon: Image.asset(Assets.imagesMyOrderHome, width: 30, height: 30),
      activeIcon: Image.asset(Assets.imagesMyOrderHome2, width: 30, height: 30),
    ),

    BottomNavigationBarItem(
      label: 'my_previous_requests'.tr,
      icon: Image.asset(Assets.imagesMyOrderHome, width: 30, height: 30),
      activeIcon: Image.asset(Assets.imagesMyOrderHome2, width: 30, height: 30),
    ),

    BottomNavigationBarItem(
      label: 'setting'.tr,
      icon: Image.asset(Assets.imagesSettingHomeIcon,
          width: 30, height: 30, color: Themes.ColorApp11),
      activeIcon: Image.asset(Assets.imagesSettingHomeIcon,
          width: 30, height: 30, color: Themes.ColorApp1),
    ),
  ];
}
