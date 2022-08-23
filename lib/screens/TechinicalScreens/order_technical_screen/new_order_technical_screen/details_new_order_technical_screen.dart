
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';

import '../../../../generated/assets.dart';
import '../../../../model/MyWaitingOrderModel.dart';
import '../../../../utils/componant/CustomButtonWidget.dart';
import '../../../../utils/constant/Themes.dart';
import '../../../../utils/widget/custom_circler_progress_indicator_widget.dart';
import '../../../../utils/widget/custom_phone_and_password_widget.dart';
import '../../../UserScreens/home_main_screen/home_main_screen.dart';

class DetailsNewOrderTechnicalScreen extends StatefulWidget {
   DetailsNewOrderTechnicalScreen({Key? key,required this.newOrder}) : super(key: key);
   MyWaitingOrderModel newOrder;

  @override
  State<DetailsNewOrderTechnicalScreen> createState() => _DetailsNewOrderTechnicalScreenState();
}

class _DetailsNewOrderTechnicalScreenState extends State<DetailsNewOrderTechnicalScreen> {


  TextEditingController valueOrder = TextEditingController();
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
                                AddressDetailsOrder(newOrder: widget.newOrder,),
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
                                DetailsOrder(widthValue, 'type_of_casting'.tr, '${widget.newOrder.castingType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'execution_date'.tr, '${widget.newOrder.executionDate}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'quantity'.tr, '${widget.newOrder.qtyM}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'mix_type'.tr, '${widget.newOrder.mixType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'cement_type'.tr, '${widget.newOrder.cementType}'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'name_client'.tr, 'احمد محمد'),
                                SizedBox(
                                  height: heightValue * .7,
                                ),
                                DetailsOrder(widthValue, 'mobile_number'.tr, '0115043662'),
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
                                              '${25}',
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
                                  height: heightValue * .7,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'order_will_be_received'.tr,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Themes.ColorApp8,
                                          ),
                                        ),
                                        SizedBox(width: widthValue * .5,),
                                        Text(
                                          '${widget.newOrder.executionDate}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Themes.ColorApp8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: heightValue * .6,
                                    ),
                                  ],
                                ),
                                SizedBox(height: heightValue * .7,),
                                CustomTextFieldWidget(title: 'value_order', keyboardType: TextInputType.text, textEditingController: valueOrder),
                                SizedBox(height: heightValue * .5,),
                                CirclerProgressIndicatorWidget(isLoading:  false),
                                SizedBox(height: heightValue * .7,),
                                CustomButtonImage(title: 'button_value_order'.tr, hight: 50, onTap: (){
                                  // CustomFlutterToast(currentOrder.id.toString());
                                  // CustomFlutterToast(currentOrder.executionDate);
                                  // CustomFlutterToast(myCurrentOrderController.formattedDateCurrent);
                                  // if ((currentOrder.executionDate!.compareTo(myCurrentOrderController.formattedDateCurrent!) <= 0 &&
                                  //     currentOrder.executionDate!.compareTo(myCurrentOrderController.formattedDateCurrent!) >= 0)){
                                  //   Get.find<MyCurrentOrderController>().ReceivedOrder('${currentOrder.id}');
                                  // }else {
                                  //   CustomFlutterToast('operation_cannot_be_completed'.tr);
                                  // }
                                  Get.to(const HomeMainScreen());
                                }),
                              ],
                            )
                        ),
                      ),
                    ),
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
  AddressDetailsOrder({required this.newOrder});

  MyWaitingOrderModel newOrder;
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
                    '${newOrder.address}',
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
          '$title : ',
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

