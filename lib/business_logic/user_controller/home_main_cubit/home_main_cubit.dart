import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:pain_appertment/generated/assets.dart';

import '../../../screens/UserScreens/home_screen/home_screen.dart';
import '../../../screens/UserScreens/my_order/my_order.dart';
import '../../../screens/UserScreens/request_service_screen/request_service_screen.dart';
import '../../../screens/UserScreens/setting_screen/setting_screen.dart';
import '../../../utils/constant/Themes.dart';

part 'home_main_state.dart';

class HomeMainCubit extends Cubit<HomeMainState> {
  HomeMainCubit() : super(HomeMainInitial());

 static HomeMainCubit get(BuildContext context) => BlocProvider.of(context);

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
