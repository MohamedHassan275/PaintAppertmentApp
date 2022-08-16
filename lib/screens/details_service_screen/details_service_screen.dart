
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/generated/assets.dart';

import '../../utils/constant/Themes.dart';

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
            height: Get.height,
            color: Themes.whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
