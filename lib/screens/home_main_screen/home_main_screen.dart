
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/home_main_screen/home_main_controller.dart';

import '../../utils/constant/Themes.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeMainController>(
      init: HomeMainController(),
      builder: (homeMainController)=> Scaffold(
        body: homeMainController.navigationItem[homeMainController.index],
        bottomNavigationBar: BottomNavigationBar(
          items: homeMainController.bottomNavigationBarItem,
          onTap: (value){
            setState(() {
              homeMainController.index = value;
            });
            homeMainController.navigationItem[homeMainController.index];
          },
          currentIndex: homeMainController.index,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Themes.ColorApp1),
          unselectedIconTheme: const IconThemeData(color: Themes.ColorApp11),
        ),
      ),
    );
  }
}
