import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';
import 'package:pain_appertment/screens/UserScreens/on_boarding_screen/on_boarding_screen.dart';

import '../../../utils/constant/constant.dart';
import '../../../utils/servies/storage_service.dart';
import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), ()=> Get.offAll(AppConstants.tokenSession != ""
        ? const HomeMainScreen()
        : const OnBoardingScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Container(
        color: Colors.white,
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Image.asset(Assets.imagesLogoApp,fit: BoxFit.contain),
        ),
      )),
    );
  }
}
