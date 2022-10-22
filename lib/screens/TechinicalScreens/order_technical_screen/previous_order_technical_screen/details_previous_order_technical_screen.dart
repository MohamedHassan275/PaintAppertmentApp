
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/model/MyWaitingOrderModel.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';

import '../../../../model/order_model.dart';
import '../../../../utils/componant/CustomButtonWidget.dart';
import '../../../../utils/constant/Themes.dart';

class DetailsPreviousOrderTechnicalScreen extends StatelessWidget {
  DetailsPreviousOrderTechnicalScreen({Key? key,required this.previousOrder}) : super(key: key);
  OrderResponseModel previousOrder;
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
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
                                  DetailsOrder(widthValue, 'order_number'.tr, '#${previousOrder.orderNumber}',''),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'type_of_casting'.tr, '${previousOrder.service ?? '---'}',''),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'quantity'.tr, '${previousOrder.flatArea}','متر'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'mix_type'.tr, '${previousOrder.rooms}','غرفة نوم'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'cement_type'.tr, '${previousOrder.bathrooms}','حمام'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'name_client'.tr, '${previousOrder.firstname} ${previousOrder.firstname}',''),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'order_details'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Themes.ColorApp8,
                                        ),
                                      ),
                                      SizedBox(
                                        width: widthValue * .5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          previousOrder.description  == null? 'لا يوجد تفاصيل للطلب' : '${previousOrder.description}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Themes.ColorApp1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                              Text(
                                                '${previousOrder.offerCost}',
                                                style:  const TextStyle(
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
            onTap: () => Get.off(const HomeTechincalMainScreen()),
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

  OrderResponseModel previousOrder;
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
              child: const Center(
                child:  Image(
                  image:  AssetImage(Assets.iconsDistanceIcon),
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
                    '${previousOrder.governorate} ${previousOrder.city}',
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
  DetailsOrder(this.widthValue,this.title,this.details,this.title2);

  late double widthValue;
  late String title, details,title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title : ',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp8,
          ),
        ),
        SizedBox(
          width: widthValue * .5,
        ),
        Text(
          details,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp1,
          ),
        ),
        SizedBox(
          width: widthValue * .5,
        ),
        Text(
          title2,
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

