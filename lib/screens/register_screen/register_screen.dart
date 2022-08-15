
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/login_screen/login_screen.dart';
import 'package:pain_appertment/utils/constant/constant.dart';

import '../../generated/assets.dart';
import '../../utils/componant/CustomButtonWidget.dart';
import '../../utils/componant/CustomTextFieldWidget.dart';
import '../../utils/constant/Themes.dart';
import '../../utils/widget/custom_circler_progress_indicator_widget.dart';
import '../../utils/widget/custom_phone_and_password_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController FirstName = TextEditingController();
  TextEditingController MobilePhone = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  late String mobilePhone;
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isCheckAccepted = false;
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          color: Themes.whiteColor,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: heightValue * 2.5,),
              Image.asset(
                Assets.imagesLogoApp,
                fit: BoxFit.contain,
                height: 150,
              ),
              SizedBox(height: heightValue * 1,),
              Text('create_account'.tr,textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),),
              SizedBox(height: heightValue*1.2,),
              FromTextRegisterShared(
                  labelText: 'first_name'.tr,
                  readOnly: false,
                  isPassword: false,
                  onTapValidator: (value) {
                    if (value!.isEmpty) {
                      return 'must_not_empty'.tr;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  Controller: FirstName,
                  hintText: 'first_name'.tr),
              SizedBox(
                height: heightValue * 1,
              ),
              FromTextRegisterShared(
                  labelText: 'last_name'.tr,
                  readOnly: false,
                  onTapValidator: (value) {
                    if (value!.isEmpty) {
                      return 'must_not_empty'.tr;
                    }
                    return null;
                  },
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  Controller: LastName,
                  hintText: 'last_name'.tr),
              SizedBox(
                height: heightValue * 1,
              ),
              FromTextRegisterShared(
                  labelText: 'email_address'.tr,
                  onTapValidator: (value) {
                    if (value!.isEmpty) {
                      return 'must_not_empty'.tr;
                    } else if (!(value.contains("@"))) {
                      return 'not_valid'.tr;
                    }
                    return null;
                  },
                  readOnly: false,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                  Controller: Email,
                  hintText: 'email_address'.tr),
              SizedBox(
                height: heightValue * 1,
              ),
              FromTextRegisterShared(
                //  textAlign: TextAlign.center,
                labelText: 'password'.tr,
                onTapFunction: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context)
                        .requestFocus(_focusNodePassword);
                  });
                },
                readOnly: false,
                focusNode: _focusNodePassword,
                isPassword: isPassword,
                onTapValidator: (value) {
                  if (value!.isEmpty) {
                    return 'must_not_empty'.tr;
                  } else if (value.length <= 5) {
                    return 'short_password'.tr;
                  }
                  return null;
                },
                suffixIcon: isPassword
                    ? Icons.visibility_sharp
                    : Icons.visibility_off,
                onTapsuffixIcon: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                keyboardType: TextInputType.text,
                maxLines: 1,
                Controller: Password,
                hintText: 'password'.tr,
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              FromTextRegisterShared(
                //  textAlign: TextAlign.center,
                labelText: 'confirm_password'.tr,
                onTapFunction: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(
                        _focusNodeConfirmPassword);
                  });
                },
                readOnly: false,
                focusNode: _focusNodeConfirmPassword,
                isPassword: isConfirmPassword,
                onTapValidator: (value) {
                  if (value!.isEmpty) {
                    return 'must_not_empty'.tr;
                  } else if (value.length <= 5) {
                    return 'short_password'.tr;
                  } else if (!(value
                      .contains(Password.text))) {
                    return 'Password_does_not_match'.tr;
                  }
                  return null;
                },
                suffixIcon: isConfirmPassword
                    ? Icons.visibility_sharp
                    : Icons.visibility_off,
                onTapsuffixIcon: () {
                  setState(() {
                    isConfirmPassword = !isConfirmPassword;
                  });
                },
                keyboardType: TextInputType.text,
                maxLines: 1,
                Controller: ConfirmPassword,
                hintText: 'confirm_password'.tr,
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25),
                child: Row(
                  children: [
                    Theme(
                        data: ThemeData(
                            unselectedWidgetColor:
                            Themes.ColorApp1),
                        child: Checkbox(
                            value: isCheckAccepted,
                            tristate: false,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(5)),
                            side: const BorderSide(
                                color: Themes.ColorApp1,
                                width: 2.0),
                            activeColor: Themes.ColorApp1,
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckAccepted = value!;
                              });
                            })),
                    InkWell(
                      onTap: () {
                        // _modalBottomSheetMenu();
                      },
                      child: Text(
                        "agree_to_terms".tr,
                        style: const TextStyle(
                          color: Themes.ColorApp1,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightValue * .2,
              ),
              CirclerProgressIndicatorWidget(isLoading: false),
              SizedBox(
                height: heightValue * .5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25, vertical: 15),
                child: CustomButtonImage(
                    hight: 50,
                    title: 'register'.tr,
                    onTap: () {
                      // isCheckAccepted == true ? controller.createAccount(widget.mobilePhone, FirstName.text,
                      //     LastName.text, Email.text, Password.text) : CustomFlutterToast('agree_to_terms2'.tr);
                      isCheckAccepted == true ? CustomFlutterToast('تم تسجيلك بنجاح') :CustomFlutterToast('agree_to_terms2'.tr);
                    }
                ),
              ),
              SizedBox(
                height: heightValue * .5,
              ),
             const CreateAccountFromLoginWidget(),
              SizedBox(
                height: heightValue * 1,
              ),
            ],
          ),
        ),
      )),
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
                'have_account'.tr,
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
                onTap: () => Get.to(const LoginScreen()),
                child: Text(
                  'login'.tr,
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

