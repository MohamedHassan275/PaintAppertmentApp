import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../business_logic/OnBoardingController.dart';
import '../../../../utils/componant/CustomButtonWidget.dart';
import '../../login_screen/login_screen.dart';
class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double valueHeight = Get.height * .024;
    final double valueWidth = Get.width * .024;
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Positioned(
          bottom: valueHeight * 4.5,
          left: valueWidth* 1,
          right: valueWidth* 1,
          child: Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: CustomButtonImage(
                hight: 50,
                title: controller.pageController!.hasClients ? (controller.currentPage == 3 ? 'get_started'.tr : 'next'.tr) : 'next'.tr,
                onTap: () {
                  if (controller.currentPage != 3) {
                    controller.pageController?.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                  } else {
                    Get.to(() => const LoginScreen(), transition: Transition.rightToLeft , duration: const Duration(milliseconds: 500));
                  }
                },
              ),
            ),
          ),
        ));
  }
}
