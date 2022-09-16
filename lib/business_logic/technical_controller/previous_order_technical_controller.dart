
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../model/MyWaitingOrderModel.dart';

class PreviousOrderTechnicalController extends GetxController {

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



}