
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';
import 'package:pain_appertment/screens/UserScreens/login_screen/login_controller.dart';
import 'package:pain_appertment/utils/componant/CustomButtonWidget.dart';

import '../../../generated/assets.dart';
import '../../../utils/constant/Themes.dart';
import '../../../utils/widget/custom_circler_progress_indicator_widget.dart';
import '../../../utils/widget/custom_phone_and_password_widget.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool showProgressbar = true;
  bool isPassword = true;
  String? mobilePhone, password,firebase_token;
  TextEditingController MobilePhone = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          color: Themes.whiteColor,
          width: Get.width,
          child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: heightValue * 2.5,),
                Image.asset(
                  Assets.imagesLogoApp,
                  fit: BoxFit.contain,
                  height: 150,
                ),
                SizedBox(height: heightValue * 1,),
                Text('login'.tr,textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),),
                Form(
                  key: controller.form,
                  child: Column(
                    children: [
                      SizedBox(height: heightValue*1.2,),
                      TextFieldMobileWidget(textEditingController: MobilePhone,),
                      SizedBox(height: heightValue*.7,),
                      TextFieldPasswordWidget(textEditingController: Password, isPassword: isPassword),
                      SizedBox(height: heightValue * 1,),
                      const ForgetPasswordWidget(),
                      SizedBox(height: heightValue * .2,),
                      CirclerProgressIndicatorWidget(isLoading: false),
                      SizedBox(height: heightValue * 1,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: CustomButtonImage(title: 'login'.tr, hight: 55, onTap: (){
                          controller.checkLoginUser(MobilePhone.text, Password.text);
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: heightValue * 1,),
                const CreateAccountFromLoginWidget(),
                SizedBox(height: heightValue * 1,)
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              child: Text('forget_password'.tr,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Themes.ColorApp15,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  )),
            //  onTap: () =>  Get.to(ForgetPasswordByMobile())
          ),
        ],
      ),
    );
  }
}

class CreateAccountFromLoginWidget extends StatelessWidget {
  const CreateAccountFromLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 25),
      child: Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
          color: Themes.ColorApp7,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text(
                'not_account'.tr,
                style: const TextStyle(
                  fontSize: 13,
                  color: Themes.ColorApp2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () => Get.to(const RegisterScreen()),
                child: Text(
                  'create_account'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Themes.ColorApp6,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
