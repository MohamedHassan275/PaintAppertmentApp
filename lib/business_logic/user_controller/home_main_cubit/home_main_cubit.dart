import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_current_order_screen/my_current_order_screen.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_previous_order_screen/my_previous_order_screen.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_waiting_order_screen/my_waiting_order_screen.dart';

import '../../../screens/UserScreens/home_screen/home_screen.dart';
import '../../../screens/UserScreens/setting_screen/setting_screen.dart';
import '../../../utils/constant/Themes.dart';

part 'home_main_state.dart';

class HomeMainCubit extends Cubit<HomeMainState> {
  HomeMainCubit() : super(HomeMainInitial());

  static HomeMainCubit get(BuildContext context) => BlocProvider.of(context);

  int index = 0;
  List<Widget> navigationItem = [
    const HomeScreen(),
    const MyWaitingOrderScreen(),
    const MyCurrentOrderScreen(),
    const MyPreviousOrderScreen(),
    const SettingScreen()
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    BottomNavigationBarItem(
        icon: Image.asset(Assets.imagesIconHome2,
            width: 30, height: 30, color: Themes.ColorApp11),
        label: 'home'.tr,
        activeIcon: Image.asset(Assets.iconsHomeIcon,
            width: 30, height: 30, color: Themes.ColorApp1)),
    BottomNavigationBarItem(
        icon: Image.asset(Assets.imagesMyOrderHome, width: 30, height: 30),
        label: 'my_new_order'.tr,
        activeIcon: Image.asset(Assets.imagesMyOrderHome2, width: 30, height: 30)),
    BottomNavigationBarItem(
        icon: Image.asset(Assets.imagesMyOrderHome, width: 30, height: 30),
        label: 'my_active_current'.tr,
        activeIcon: Image.asset(Assets.imagesMyOrderHome2, width: 30, height: 30)),
    BottomNavigationBarItem(
        icon: Image.asset(Assets.imagesMyOrderHome, width: 30, height: 30),
        label: 'my_previous_requests'.tr,
        activeIcon: Image.asset(Assets.imagesMyOrderHome2, width: 30, height: 30)),
    BottomNavigationBarItem(
        icon: Image.asset(Assets.imagesSettingHomeIcon,
            width: 30, height: 30, color: Themes.ColorApp11),
        label: 'setting'.tr,
        activeIcon: Image.asset(Assets.imagesSettingHomeIcon,
            width: 30, height: 30, color: Themes.ColorApp1)),
  ];
}
