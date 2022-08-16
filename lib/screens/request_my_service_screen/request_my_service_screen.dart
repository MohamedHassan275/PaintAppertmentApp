
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/componant/CustomButtonWidget.dart';
import '../../utils/constant/Themes.dart';
import '../../utils/widget/custom_circler_progress_indicator_widget.dart';
import '../../utils/widget/custom_phone_and_password_widget.dart';
import 'RequestMyServiceController.dart';

class RequestMyServiceScreen extends StatelessWidget {
  const RequestMyServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController DistanceApperment = TextEditingController();
    TextEditingController RoomNumber = TextEditingController();
    TextEditingController RestRoom = TextEditingController();
    TextEditingController Country = TextEditingController();
    TextEditingController State = TextEditingController();
    TextEditingController FirstName = TextEditingController();
    TextEditingController MobilePhone = TextEditingController();
    TextEditingController LastName = TextEditingController();

    var height = Get.height * 0.024;
    var width = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<RequestMyServiceController>(
          init: RequestMyServiceController(),
          builder: (controller)=> SingleChildScrollView(
            child: Form(
              key: controller.from,
              child: Column(
                children: [
                  SizedBox(height: height * 1.5,),
                  const Text(
                    'طلب عرض سعر  لتكاليف شقتك',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      overflow: TextOverflow.fade,
                      color: Themes.ColorApp15,
                    ),
                  ),
                  SizedBox(height: height * 1.5,),
                  // CustomTextFieldWidget(title: 'distance_appertment', keyboardType: TextInputType.number, textEditingController: DistanceApperment),
                  // SizedBox(
                  //   height: height * .5,
                  // ),
                  // CustomTextFieldWidget(title: 'room_number', keyboardType: TextInputType.number, textEditingController: RoomNumber),
                  // SizedBox(
                  //   height: height * .5,
                  // ),
                  // CustomTextFieldWidget(title: 'rest_room', keyboardType: TextInputType.number, textEditingController: RestRoom),
                  // SizedBox(
                  //   height: height * .5,
                  // ),
                  CustomTextFieldWidget(title: 'first_name', keyboardType: TextInputType.text, textEditingController: FirstName),
                  SizedBox(
                    height: height * .5,
                  ),
                  CustomTextFieldWidget(title: 'last_name', keyboardType: TextInputType.text, textEditingController: LastName),
                  SizedBox(
                    height: height * .5,
                  ),
                  CustomTextFieldWidget(title: 'mobile_number', keyboardType: TextInputType.number, textEditingController: MobilePhone,maxLength: 11),
                  SizedBox(
                    height: height * .5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: CustomTextFieldWidget(title: 'country', keyboardType: TextInputType.text, textEditingController: Country)),
                      Expanded(child: CustomTextFieldWidget(title: 'state', keyboardType: TextInputType.text, textEditingController: State)),
                    ],
                  ),
                  SizedBox(
                    height: height * .7,
                  ),
                  CirclerProgressIndicatorWidget(isLoading: false),
                  SizedBox(height: height * .7,),
                  CustomButtonImage(title: 'request_price2', hight: 50, onTap: ()=> controller.sendRequestService()),
                  SizedBox(height: height * 1,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}