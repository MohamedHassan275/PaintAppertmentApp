import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../business_logic/OnBoardingController.dart';
import '../../../../utils/constant/Themes.dart';
class CustomDots extends StatelessWidget {
  const CustomDots({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double valueHeight = Get.height * .024;
    return GetBuilder<OnBoardingControllerImp>(
      init: OnBoardingControllerImp(),
      builder: (controller) => Positioned(
        bottom: valueHeight * 9.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(4,
                    (index) => AnimatedContainer(
                  margin: const EdgeInsets.all(2),
                  child: Container(
                    width: 3, height: controller.currentPage == index ? 20 : 12,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        color: controller.currentPage == index ? Themes.ColorApp1 : Themes.ColorApp11),
                  ),
                  duration: const Duration(milliseconds: 900),
                ))
          ],
        ),
      ),
    );
  }
}