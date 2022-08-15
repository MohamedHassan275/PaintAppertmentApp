import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/OnBoardingController.dart';
import '../../../utils/constant/Themes.dart';

class CustomDots extends StatelessWidget {
 const CustomDots();

  @override
  Widget build(BuildContext context) {
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;
    return GetBuilder<OnBoardingControllerImp>(
      init: OnBoardingControllerImp(),
      builder: (controller) => Positioned(
        left: 0,
        right: 0,
        bottom: valueHight * 9.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                4,
                (index) => AnimatedContainer(
                      margin: const EdgeInsets.all(2),
                      child: Container(
                        width: 3,
                        height: controller.currentPage == index ? 20 : 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: controller.currentPage == index ? Themes.ColorApp1 : Themes.ColorApp11),
                      ),
                      duration: Duration(milliseconds: 900),
                    ))
          ],
        ),
      ),
    );
  }
}

// SmoothPageIndicator(count: 4,
// controller: pageController!,
// effect: ExpandingDotsEffect(
// activeDotColor: Themes.ColorApp1,
// dotColor: Themes.ColorApp11,
// dotHeight: 15,
// dotWidth: 15,
// spacing: 5
// ),)
