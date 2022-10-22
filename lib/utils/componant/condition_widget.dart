import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/Themes.dart';


class ConditionWidget extends StatelessWidget {
  String title;
  Function() onTap;
  Color color;
  Color textColor;
  ConditionWidget(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          width: Get.width,
          height: 65,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Themes.ColorApp6, width: 1),
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, overflow: TextOverflow.ellipsis,maxLines : 1, style: TextStyle(color: textColor,fontSize: 16)),
                const Icon(Icons.keyboard_arrow_down,size: 30,color: Themes.ColorApp6,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
