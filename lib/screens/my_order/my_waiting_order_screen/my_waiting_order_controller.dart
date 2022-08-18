
import 'package:get/get.dart';
import 'package:pain_appertment/model/MyWaitingOrderModel.dart';

class MyWaitingOrderController extends GetxController {

  bool Loading = false;

  get loading => Loading;

  setLoading (bool loading){
    this.Loading = loading;
    update();
  }

  List<MyWaitingOrderModel> myWaitingOrderModel = [
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
    MyWaitingOrderModel("شطب شقتك","12345","كهرباء","12/06/2022","125 متر","5 غرف ","5 حمامات","القاهرة مدينة نصر"),
  ];
}