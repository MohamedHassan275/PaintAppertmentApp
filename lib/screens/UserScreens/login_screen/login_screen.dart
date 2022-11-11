import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/register_technical_screen/register_technical_screen.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';
import 'package:pain_appertment/utils/componant/CustomButtonWidget.dart';
import 'package:pain_appertment/utils/constant/constant.dart';
import 'package:pain_appertment/utils/servies/storage_service.dart';
import '../../../business_logic/user_controller/auth_cubit/auth_cubit.dart';
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

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver{
  late StreamSubscription onTokenRefreshListen;
  String? fcmToken;
  bool showProgressbar = true;
  bool isPassword = true;
  TextEditingController mobilePhoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            color: Themes.whiteColor,
            width: Get.width,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                _handleLoginListener(context, state);
              },
              builder: (context, state) {
                AuthCubit authCubit = AuthCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: heightValue * 2.5,
                    ),
                    Image.asset(
                      Assets.imagesLogoApp,
                      fit: BoxFit.contain,
                      height: 150,
                    ),
                    SizedBox(
                      height: heightValue * 1,
                    ),
                    Text(
                      'login'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Form(
                      key: form,
                      child: Column(
                        children: [
                          SizedBox(
                            height: heightValue * 1.2,
                          ),
                          TextFieldMobileWidget(
                            textEditingController: mobilePhoneController,
                          ),
                          SizedBox(
                            height: heightValue * .7,
                          ),
                          TextFieldPasswordWidget(
                              textEditingController: passwordController,
                              isPassword: isPassword),
                          SizedBox(
                            height: heightValue * 1,
                          ),
                          const ForgetPasswordWidget(),
                          SizedBox(
                            height: heightValue * 1,
                          ),
                          state is LoginLoadingState
                              ? CirclerProgressIndicatorWidget(isLoading: true)
                              : Container(),
                          SizedBox(
                            height: heightValue * 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: CustomButtonImage(
                                title: 'login'.tr,
                                hight: 55,
                                onTap: () {
                                  if (form.currentState!.validate()) {
                                    FirebaseMessaging.instance.getToken().then((value) {
                                      if (value != null) {
                                        if (fcmToken == null) {
                                          authCubit.setLoginUser(
                                              mobilePhoneController.text,
                                              passwordController.text, value);
                                              //print('token device');
                                           //   CustomFlutterToast(value);
                                          //print(value);
                                        }
                                      }
                                    });

                                    //print('token is ${AppConstants.tokenSession}');

                                    ///when token expires from firebase
                                    onTokenRefreshListen =
                                        FirebaseMessaging.instance.onTokenRefresh.listen((value) {
                                          authCubit.setLoginUser(
                                              mobilePhoneController.text,
                                              passwordController.text, value);
                                          //print('token device');
                                        //  CustomFlutterToast(value);
                                        });
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightValue * 1,
                    ),
                    const CreateAccountFromLoginWidget(),
                    SizedBox(
                      height: heightValue * 1,
                    ),
                    const CreateAccountFromLoginTechnicalWidget(),
                    SizedBox(
                      height: heightValue * 1,
                    ),
                  ],
                );
              },
            )),
      )),
    );
  }

  void _handleLoginListener(BuildContext context, AuthState state) {
    if (state is ErrorLoginState) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'خطأ',
        desc: state.error,
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
        btnCancelColor: Themes.ColorApp9,
        btnOkColor: Themes.ColorApp17,
        btnCancelOnPress: () {
          //Navigator.canPop(context);
        },
        btnOkOnPress: () {
         // Navigator.canPop(context);
        },
      ).show();
    } else if (state is LoginSuccessState) {

      Get.find<StorageService>().setToken('${state.loginModel?.data?.accesstoken}');
      Get.find<StorageService>().setType('${state.loginModel?.data?.type}');
      _clearFormData();
     if(state.loginModel!.data!.type!.contains('0')){
       Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) => const HomeMainScreen()),
               (_) => false);
     }else if(state.loginModel!.data!.type!.contains('1')){
       Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) => const HomeTechincalMainScreen()),
               (_) => false);
     }
    }
  }

  void _clearFormData() {
    mobilePhoneController.clear();
    passwordController.clear();
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


class CreateAccountFromLoginTechnicalWidget extends StatelessWidget {
  const CreateAccountFromLoginTechnicalWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                onTap: () => Get.to(const RegisterTechnicalScreen()),
                child: Text(
                  'register_technical'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Themes.ColorApp6,
                    fontWeight: FontWeight.bold,
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

class CreateAccountFromLoginWidget extends StatelessWidget {
  const CreateAccountFromLoginWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    fontWeight: FontWeight.bold,
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
