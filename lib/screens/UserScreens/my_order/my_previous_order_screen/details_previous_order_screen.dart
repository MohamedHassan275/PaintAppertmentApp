import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/model/MyWaitingOrderModel.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_previous_order_screen/my_previous_order_controller.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/componant/CustomButtonWidget.dart';
import '../../../../utils/constant/Themes.dart';
import '../../home_main_screen/home_main_screen.dart';

class DetailsPreviousOrderScreen extends StatelessWidget {
  DetailsPreviousOrderScreen({Key? key,required this.previousOrder}) : super(key: key);
   MyWaitingOrderModel previousOrder;
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    MyPreviousOrderController myPreviousOrderController = Get.put(MyPreviousOrderController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
        //  myPreviousOrderController.getPreviousMyOrderUser();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppbarDetailsOrder(widthValue, heightValue),
                        SizedBox(
                          height: heightValue * 1.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AddressDetailsOrder(previousOrder: previousOrder,),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  const Divider(
                                    height: 10,
                                    color: Themes.ColorApp2,
                                  ),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'type_of_casting'.tr, '${previousOrder.castingType}'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'execution_date'.tr, '${previousOrder.executionDate}'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'quantity'.tr, '${previousOrder.qtyM}'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'mix_type'.tr, '${previousOrder.mixType}'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'cement_type'.tr, '${previousOrder.cementType}'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'name'.tr, 'احمد محمد'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'rate'.tr, 'جيد'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Themes.ColorApp14,
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'request_price'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Themes.ColorApp17,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                '${350}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: Themes.ColorApp1,
                                                ),
                                              ),
                                              SizedBox(width: widthValue* .3,),
                                              Text(
                                                'sar'.tr,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: Themes.ColorApp1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightValue * 1.2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: heightValue * 2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Payment_completed_successfully'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Themes.ColorApp1,
                          ),
                        ),
                        SizedBox(
                          height: heightValue * .5,
                        ),
                        CustomButtonImage(title:  'Payment_completed_successfully'.tr ,
                            hight: 50, onTap: (){
                              // if ((myPreviousOrderController.formattedDateCurrent!.compareTo(previousOrder.executionDate!) <= 0)){
                              //   CustomFlutterToast('operation_cannot_be_completed'.tr);
                              // }else {
                              //   CustomFlutterToast('operation cannot completed');
                              // //  myPreviousOrderController.ReceivedOrder(previousOrder.id.toString());
                              // }
                        }),
                        SizedBox(height: heightValue * 3,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AppbarDetailsOrder extends StatelessWidget {
   AppbarDetailsOrder(this.widthValue,this.heightValue);

   double heightValue,widthValue;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: 119,
          decoration: const BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35))),
          child: Center(
            child: Text(
              'contract_details'.tr,
              style: const TextStyle(
                color: Themes.ColorApp15,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: heightValue * 2.3,
          left: heightValue * 1.5,
          child: GestureDetector(
            onTap: () => Get.off(const HomeMainScreen()),
            child: const CircleAvatar(
              backgroundColor: Themes.ColorApp5,
              child: Icon(
                // Get.find<StorageService>().activeLocale.languageCode == "en"
                //     ? Icons.keyboard_arrow_right
                     Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddressDetailsOrder extends StatelessWidget {
   AddressDetailsOrder({required this.previousOrder});

   MyWaitingOrderModel previousOrder;
   var heightValue = Get.height * 0.024;
   var widthValue = Get.width * 0.024;
   @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Themes.ColorApp14,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(Assets.iconsDistanceIcon),
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${previousOrder.address}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class DetailsOrder extends StatelessWidget {
  DetailsOrder(this.widthValue,this.title,this.details);

  double widthValue;
  String title, details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp8,
          ),
        ),
        SizedBox(
          width: widthValue * .7,
        ),
        Text(
          details,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp1,
          ),
        ),
      ],
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// 'order_will_be_received'.tr,
// style: TextStyle(
// fontWeight: FontWeight.w500,
// fontSize: 15,
// color: Themes.ColorApp8,
// ),
// ),
// SizedBox(width: widthValue * .5,),
// Text(
// '${previousOrder.executionDate}',
// style: TextStyle(
// fontWeight: FontWeight.w500,
// fontSize: 15,
// color: Themes.ColorApp8,
// ),
// ),
// ],
// ),
// SizedBox(
// height: heightValue * .6,
// ),