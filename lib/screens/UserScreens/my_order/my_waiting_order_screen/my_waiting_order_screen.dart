import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_waiting_order_screen/details_waiting_order_screen.dart';
import 'package:pain_appertment/getx_controller/user_controller/my_waiting_order_controller.dart';

import '../../../../generated/assets.dart';
import '../../../../model/MyWaitingOrderModel.dart';
import '../../../../utils/componant/LoadingWidget.dart';
import '../../../../utils/constant/Themes.dart';

class MyWaitingOrderScreen extends StatelessWidget {
  const MyWaitingOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return RefreshIndicator(
      onRefresh: () async{},
      child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: GetBuilder<MyWaitingOrderController>(
                  init: MyWaitingOrderController(),
                  builder: (controller) {
                    if(controller.Loading){
                      return LoadingWidget(data: '');
                    }
                    return controller.myWaitingOrderModel.isNotEmpty ?
                    ListView.builder(
                      itemCount: controller.myWaitingOrderModel.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: MyWaitingOrderItem(MyNewOder: controller.myWaitingOrderModel[index],
                            heightValue: heightValue,widthValue: widthValue,),
                        );
                      },): NoItemOFList();
                  },),
              ),
            ),)
      ),
    );
  }
}

class NoItemOFList extends StatelessWidget {
  NoItemOFList({Key? key}) : super(key: key);

  var widthValue = Get.width * 0.024;
  var heightValue = Get.height * 0.024;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: heightValue * 2,
            ),
            Image.asset(
              Assets.imagesOfferPrice,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: heightValue * 1,
            ),
            Text(
              'no_requests_offers_have_added_before'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Themes.ColorApp8,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: heightValue * .7,
            )
          ],
        ),
      ),
    );
  }
}

class MyWaitingOrderItem extends StatelessWidget {
  MyWaitingOrderItem(
      {Key? key,
      required this.MyNewOder,
      required this.widthValue,
      required this.heightValue})
      : super(key: key);
  double heightValue, widthValue;
  MyWaitingOrderModel MyNewOder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       // Get.to(DetailsWaitingOrderScreen(newOrder: MyNewOder,));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CompanyDetails(MyNewOder),
              SizedBox(
                height: heightValue * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  height: 10,
                  color: Themes.ColorApp2,
                ),
              ),
              SizedBox(
                height: heightValue * .5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: CircleAvatar(
                        backgroundColor: Themes.ColorApp9,
                      ),
                    ),
                    SizedBox(
                      width: widthValue * 1,
                    ),
                    Text(
                      'waiting_send_offer_price'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Themes.ColorApp9,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                     Get.to(DetailsWaitingOrderScreen(newOrder: MyNewOder,));
                  },
                  child: Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp14,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'order_details'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Themes.ColorApp1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightValue * 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyDetails extends StatelessWidget {
  CompanyDetails(this.myCurrentOrderModel);

  MyWaitingOrderModel? myCurrentOrderModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Themes.ColorApp14,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(Assets.imagesFactoryNamIcon),
                    fit: BoxFit.contain,
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              SizedBox(
                width: widthValue * 1,
              ),
              Text(
                '${myCurrentOrderModel!.company}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Themes.ColorApp1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightValue * .5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'request_type'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp2,
                            ),
                          ),
                          SizedBox(
                            width: widthValue * .2,
                          ),
                          Text(
                            '${myCurrentOrderModel!.castingType}',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'quantity'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp2,
                            ),
                          ),
                          SizedBox(
                            width: widthValue * .2,
                          ),
                          Text(
                            '${myCurrentOrderModel!.qtyM}',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '#${myCurrentOrderModel!.orderNumber}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp2,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
