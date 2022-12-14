import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/model/MyWaitingOrderModel.dart';

import '../../../../generated/assets.dart';
import '../../../../model/order_model.dart';
import '../../../../utils/constant/Themes.dart';
import '../../../../utils/servies/storage_service.dart';
import '../../home_main_screen/home_main_screen.dart';

class DetailsWaitingOrderScreen extends StatefulWidget {
   DetailsWaitingOrderScreen({Key? key,required this.orderResponseModel}) : super(key: key);
   OrderResponseModel orderResponseModel;

  @override
  State<DetailsWaitingOrderScreen> createState() => _DetailsWaitingOrderScreenState();
}

class _DetailsWaitingOrderScreenState extends State<DetailsWaitingOrderScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(StorageService());
  }
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            child: Column(
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AddressDetailsOrder(newOrder: widget.orderResponseModel,),
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
                              DetailsOrder(widthValue, 'order_number'.tr, '#${widget.orderResponseModel.orderNumber}',''),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'type_of_casting'.tr, '${widget.orderResponseModel.service ?? '----'}',''),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'quantity'.tr, '${widget.orderResponseModel.flatArea}','??????'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'mix_type'.tr, '${widget.orderResponseModel.rooms}','???????? ??????'),
                              SizedBox(
                                height: heightValue * .7,
                              ),
                              DetailsOrder(widthValue, 'cement_type'.tr, '${widget.orderResponseModel.bathrooms}','????????'),
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
                                  child: Center(
                                    child: Text(
                                      'Please_wait_request'.tr,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Themes.ColorApp8,
                                      ),
                                    ),
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
              ],
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
  AddressDetailsOrder({Key? key, required this.newOrder}) : super(key: key);

  OrderResponseModel newOrder;
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
                    '${newOrder.governorate} ${newOrder.city}',
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
