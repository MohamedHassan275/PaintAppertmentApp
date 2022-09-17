import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../business_logic/OnBoardingController.dart';
import '../../../generated/assets.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/constant/Themes.dart';
import '../login_screen/login_screen.dart';
import 'Widget/Custom_dots.dart';
import 'Widget/CustomPageView.dart';
import 'Widget/custom_button.dart';
import 'Widget/custom_skip_boarding.dart';

class OnBoardingScreen extends StatefulWidget{
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnBoardingScreenState();
  }
  
}
class OnBoardingScreenState extends State<OnBoardingScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;
  var controller =  Get.put(OnBoardingControllerImp());

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
            //  Positioned(top: 100,child: Image.asset(Assets.imagesSkipBording,width: 100,height: 50,)),
            Positioned(
              top: valueHight * 7,
              right: 25,
              left: 25,
              child: GestureDetector(
               // onTap: ()=> CustomFlutterToast(Get.find<StorageService>().activeLocale.languageCode),
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
            ),
            CustomSkipBoarding(),
            Positioned(
              left: 0,
              right: 0,
              bottom: valueHight * 4.5,
              child: Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  child: CustomButtonImage(
                    hight: 50,
                    title: controller.pageController!.hasClients ? (controller.currentPage == 3 ? 'get_started'.tr : 'next'.tr) : 'next'.tr,
                    onTap: () {
                      if (controller.currentPage != 3) {
                        controller.pageController?.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      } else {
                        Get.to(() => const LoginScreen(), transition: Transition.rightToLeft , duration: const Duration(milliseconds: 500));
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}