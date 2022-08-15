import '../constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmpyList extends StatelessWidget {
  const EmpyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Image.asset(
            "assets/icons/no-items.png",
            width: Get.width / 3,
            height: Get.height / 3,
          ),
          Text(
            "no items".tr,
            style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
