
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListView extends StatelessWidget {
   CustomListView({Key? key}) : super(key: key);

  double? width,height;
  int? itemCount;
  Axis? axis;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: axis!,
        itemBuilder: (context, index) {
          if(itemCount == 0){

          }else {

          }
          return Container();
      },),
    );
  }
}
