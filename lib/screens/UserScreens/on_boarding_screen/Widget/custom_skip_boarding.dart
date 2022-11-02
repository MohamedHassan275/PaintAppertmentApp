import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../business_logic/OnBoardingController.dart';
import '../../../../utils/componant/CustomButtonWidget.dart';
import '../../../../utils/constant/on_boarding_list.dart';
import '../../login_screen/login_screen.dart';
class CustomSkipBoarding extends StatelessWidget {
  const CustomSkipBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double? valueWidth = Get.width * 0.024;
    return Material(
      type: MaterialType.transparency,
      child: GetBuilder<OnBoardingControllerImp>(
          builder: (controller) => Visibility(
            visible: controller.pageController!.hasClients ?  (controller.currentPage == 3 ? false : true) : true,
            child: Container(
              margin:  EdgeInsets.all(valueWidth * 2),
              child: CustomButtonSkipOnBoarding(
                onTap: () {
                  if (controller.pageController!.hasClients) {
                    if (controller.currentPage != myOnBoardingList.length - 1) {
                      Get.to(const LoginScreen(),
                          transition: Transition.leftToRight,
                          duration: const Duration(milliseconds: 3));
                    } else {}
                  }
                },
                title: 'skip'.tr, hight: 35,
              ),
            ),
          )),
    );
  }
}
