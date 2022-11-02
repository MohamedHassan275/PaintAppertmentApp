import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/UserScreens/on_boarding_screen/Widget/custom_button.dart';

import '../../../business_logic/OnBoardingController.dart';
import '../../../generated/assets.dart';
import '../../../utils/constant/Themes.dart';
import '../splash_screen/splash_screen.dart';
import 'Widget/Custom_dots.dart';
import 'Widget/CustomPageView.dart';
import 'Widget/custom_skip_boarding.dart';

class OnBoardingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnBoardingScreenState();
  }

}
class OnBoardingScreenState extends State<OnBoardingScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double valueHeight = Get.height * .024;
    final double valueWidth = Get.width * .024;
    Get.put(OnBoardingControllerImp());
    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(Assets.imagesBackgroundIntro),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            CustomPageView(),
            const CustomDots(),
            Positioned(
              top: valueHeight * 7,
              right: 25,
              left: 25,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Themes.whiteColor,
                child: ClipOval(
                  child: Image.asset(
                    Assets.imagesLogoApp,
                    fit: BoxFit.contain,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            CustomSkipBoarding(),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}