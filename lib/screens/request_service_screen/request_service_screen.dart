
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/home_main_screen/home_main_screen.dart';
import 'package:pain_appertment/screens/request_service_screen/request_service_controller.dart';
import 'package:pain_appertment/utils/componant/CustomButtonWidget.dart';
import 'package:pain_appertment/utils/widget/custom_circler_progress_indicator_widget.dart';
import 'package:pain_appertment/utils/widget/custom_phone_and_password_widget.dart';

import '../../utils/componant/CustomTextFieldWidget.dart';
import '../../utils/constant/Themes.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({Key? key}) : super(key: key);

  @override
  _RequestServiceScreenState createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {

  TextEditingController FirstName = TextEditingController();
  TextEditingController MobilePhone = TextEditingController();
  TextEditingController LastName = TextEditingController();


  TextEditingController Type = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = Get.height * 0.024;
    var width = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<RequestServiceController>(
        init: RequestServiceController(),
          builder: (controller)=> SingleChildScrollView(
            child: Form(
              key: controller.from,
              child: Column(
                children: [
                  SizedBox(height: height * 1.5,),
                  const Text(
                    'طلب خدمة من الشركة من فضلك ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      overflow: TextOverflow.fade,
                      color: Themes.ColorApp15,
                    ),
                  ),
                  SizedBox(height: height * 1,),
                  CustomTextFieldWidget(title: 'first_name', keyboardType: TextInputType.text, textEditingController: FirstName),
                  SizedBox(
                    height: height * 1,
                  ),
                  CustomTextFieldWidget(title: 'last_name', keyboardType: TextInputType.text, textEditingController: LastName),
                  SizedBox(
                    height: height * 1,
                  ),
                  CustomTextFieldWidget(title: 'mobile_number', keyboardType: TextInputType.number, textEditingController: MobilePhone,maxLength: 11),
                  SizedBox(
                    height: height * 1,
                  ),
                  CirclerProgressIndicatorWidget(isLoading: false),
                  SizedBox(height: height * .7,),
                  CustomButtonImage(title: 'send', hight: 50, onTap: ()=> controller.sendRequestService())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
