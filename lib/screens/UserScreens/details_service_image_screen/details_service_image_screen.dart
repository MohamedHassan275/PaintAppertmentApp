
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pain_appertment/business_logic/user_controller/home_controller.dart';
import 'package:pain_appertment/utils/constant/Themes.dart';

import '../../../generated/assets.dart';
import '../home_main_screen/home_main_screen.dart';

class DetailsServiceImageScreen extends StatefulWidget {
  const DetailsServiceImageScreen({Key? key}) : super(key: key);

  @override
  _DetailsServiceImageScreenState createState() => _DetailsServiceImageScreenState();
}

class _DetailsServiceImageScreenState extends State<DetailsServiceImageScreen> {
  @override
  Widget build(BuildContext context) {
    var width = Get.width * 0.024;
    var height = Get.height * 0.024;
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (service) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Themes.whiteColor,
              child: Column(
                children: [
                  Appbarwidget(width: width, height: height),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView.builder(
                      itemCount: service.sliderModel.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
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
                              image: AssetImage(service.sliderModel[index].image),
                              placeholder: const AssetImage(Assets.imagesLogoApp),
                            ),
                          ),
                        ),
                      )),
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
              'صور اسقف جبس بورد',
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
