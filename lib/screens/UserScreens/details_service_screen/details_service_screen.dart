
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/screens/UserScreens/home_screen/home_controller.dart';
import 'package:pain_appertment/screens/UserScreens/request_my_service_screen/request_my_service_screen.dart';
import 'package:pain_appertment/utils/componant/CustomButtonWidget.dart';

import '../../../utils/constant/Themes.dart';
import '../home_main_screen/home_main_screen.dart';

class DetailsServiceScreen extends StatelessWidget {
  const DetailsServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = Get.height * 0.024;
    var width = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Themes.whiteColor,
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Appbarwidget(width: width, height: height),
                  SizedBox(height: height*1.5,),
                  FadeInImage(
                    height: 135,
                    width: Get.width,
                    fit: BoxFit.fill,
                    image: AssetImage(Assets.imagesLogoApp),
                    placeholder: AssetImage(Assets.imagesLogoApp),
                  ),
                  // Image.asset(Assets.imagesLogoApp,
                  // height: 135,
                  // width: Get.width,
                  // fit: BoxFit.contain,),
                  SizedBox(height: height* .7,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          'خدامات كهرباء',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            overflow: TextOverflow.fade,
                            color: Themes.ColorApp15,
                          ),
                        ),
                        SizedBox(height: height* .5,),
                        const Text(
                          ' خدامات كهرباء خدامات كهرباء خدامات كهرباء خدامات كهرباء خدامات كهرباء خدامات كهرباء',
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            overflow: TextOverflow.fade,
                            color: Themes.ColorApp15,
                          ),
                        ),
                        SizedBox(height: height* .7,),
                        const Text(
                          ' صور الخدمة ',
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            overflow: TextOverflow.fade,
                            color: Themes.ColorApp15,
                          ),
                        ),
                        SizedBox(height: height* .7,),
                        SizedBox(
                          height: 215,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.sliderModel.length,
                            scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Card(
                                elevation: 2,
                            color: Themes.whiteColor,
                            child: Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FadeInImage(
                                  height: 200,
                                  width: 300,
                                  fit: BoxFit.fill,
                                  image: AssetImage(controller.sliderModel[index].image),
                                  placeholder: AssetImage(Assets.imagesLogoApp),
                                ),
                              ),
                            ),
                          ))),
                        SizedBox(height: height * 3.5,),
                        CustomButtonImage(title: 'request_price2'.tr, hight: 50, onTap: () => Get.to(const RequestMyServiceScreen())),
                        SizedBox(height: height * 1,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Appbarwidget extends StatelessWidget {
  Appbarwidget({Key? key,required this.width, required this.height}) : super(key: key);
  double height,width;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: 119,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.only(
                  topRight:  Radius.circular(25),
                  topLeft: Radius.circular(25))),
          child: const Center(
            child: Text(
              'كهرباء',
              style: TextStyle(
                color: Themes.ColorApp15,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 2.3,
          left: width * 1.5,
          child: GestureDetector(
            onTap: () => Get.off(const HomeMainScreen()),
            child: const CircleAvatar(
              backgroundColor: Themes.ColorApp5,
              child:  Icon(
                // Get.find<StorageService>()
                //     .activeLocale
                //     .languageCode ==
                //     "en"
                //     ? Icons.keyboard_arrow_right:
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
