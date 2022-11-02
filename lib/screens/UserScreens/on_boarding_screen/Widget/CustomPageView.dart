import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../business_logic/OnBoardingController.dart';
import 'custom_page_virw_item.dart';


class CustomPageView extends GetView<OnBoardingControllerImp> {

  @override
  Widget build(BuildContext context) {
    double doubleHeight = Get.height * 0.024 * 2.5;
    return PageView(
      controller: controller.pageController,
      onPageChanged: (int index){
        controller.onchange(index);
      },
     children: [
       CustomPageViewItem(title: 'title_boarding1'.tr,),
       CustomPageViewItem(title: 'title_boarding2'.tr,),
       CustomPageViewItem(title: 'title_boarding3'.tr,),
       CustomPageViewItem(title: 'title_boarding4'.tr,),
     ],
    );
  }
}

