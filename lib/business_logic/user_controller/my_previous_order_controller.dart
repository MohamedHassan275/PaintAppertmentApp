import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../../model/MyWaitingOrderModel.dart';


class MyPreviousOrderController extends GetxController {

  bool Loading = false;
 // List<PreviousOrder>? _previousOrder;
  String? _formattedDateCurrent;
  get loading => Loading;
  get formattedDateCurrent => _formattedDateCurrent;
 // List<PreviousOrder>? get previousOrder => _previousOrder;

  getCurrentTime(){
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    _formattedDateCurrent = formatter.format(now);
    print(formattedDateCurrent);
   // CustomFlutterToast(formattedDateCurrent);
  }

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  List<MyWaitingOrderModel> previousOrder = [
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
  ];


  // setMyOrderUser(List<PreviousOrder>? previousOrder){
  //   _previousOrder = previousOrder;
  // }

  // MyPreviousOrderController(){
  //   getPreviousMyOrderUser();
  //   getCurrentTime();
  // }

  // getPreviousMyOrderUser(){
  //   setLoading(true);
  //   MyServiceApi.GetMyPreviousOrderUser(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode).then((value){
  //     print("my order status is ${value?.success}");
  //     if(value?.success == true){
  //       print("my previousOrder order status is ${value?.previousOrder!.length}");
  //       setLoading(false);
  //       setMyOrderUser(value?.previousOrder);
  //     }else if(value?.success == false){
  //       setLoading(false);
  //       CustomFlutterToast(value?.message);
  //     }
  //   });
  // }

}