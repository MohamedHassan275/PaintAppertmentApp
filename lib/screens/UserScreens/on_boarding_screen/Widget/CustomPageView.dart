import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/OnBoardingController.dart';
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


// PageView.builder(
// controller: controller.pageController,
// itemCount: myOnBoardingList.length,
// onPageChanged: (int index){
// controller.onchange(index);
// },
// itemBuilder: (BuildContext context, int index) => Material(
// type: MaterialType.transparency,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// SizedBox(height: Get.height * .024 * 10.5,),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
// child: Container(
// width: Get.width,
// height: 185,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
// child: Center(
// child: Padding(
// padding: EdgeInsets.symmetric(horizontal: 15 , vertical: doubleHeight),
// child: Text(
// myOnBoardingList[index].title!,
// style: TextStyle(
// fontSize: 17,
// color: Themes.ColorApp8,
// fontWeight: FontWeight.w500,
// ),
// textAlign: TextAlign.center,
// ),
// ),
// ),
// ),
// ),
// SizedBox(height: MediaQuery.of(context).size.height * .024 * 1,),
// ],
// ),
// ),
// )