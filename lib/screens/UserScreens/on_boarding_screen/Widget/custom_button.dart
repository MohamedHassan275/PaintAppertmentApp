
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/OnBoardingController.dart';
import '../../../../utils/componant/CustomButtonWidget.dart';
import '../../login_screen/login_screen.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double valueHight = Get.height * .024;
    final double valueWidth = Get.width * .024;

    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Positioned(
      left: 0,
      right: 0,
      bottom: valueHight * 4.5,
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: CustomButtonImage(
            hight: 50,
            title: controller.pageController!.hasClients ? (controller.currentPage == 3 ? 'get_started'.tr : 'next'.tr) : 'next'.tr,
            onTap: () {
              if (controller.currentPage != 3) {
                controller.pageController?.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Get.to(() => LoginScreen(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));
              }
            },
          ),
        ),
      ),
    ));
  }
}
