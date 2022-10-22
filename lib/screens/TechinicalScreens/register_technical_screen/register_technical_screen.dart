import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/chose_tehnical_service_screen/chose_tehnical_service_screen.dart';
import 'package:pain_appertment/screens/UserScreens/login_screen/login_screen.dart';
import '../../../business_logic/user_controller/auth_cubit/auth_cubit.dart';
import '../../../generated/assets.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/componant/CustomTextFieldWidget.dart';
import '../../../utils/componant/condition_widget.dart';
import '../../../utils/constant/Themes.dart';
import '../../../utils/constant/custom_toast.dart';
import '../../../utils/servies/storage_service.dart';
import '../../../utils/widget/custom_phone_and_password_widget.dart';

class RegisterTechnicalScreen extends StatefulWidget {
  const RegisterTechnicalScreen({Key? key,this.choseService,this.firstName,this.mobilePhone,this.lastName,
    this.email,this.country,this.state,this.password,this.confirmPassword,this.choseServiceId}) : super(key: key);
  final String? choseService,choseServiceId,firstName,mobilePhone,lastName,email,country,state,password,confirmPassword;

  @override
  _RegisterTechnicalScreenState createState() => _RegisterTechnicalScreenState();
}

class _RegisterTechnicalScreenState extends State<RegisterTechnicalScreen> {

  TextEditingController FirstName = TextEditingController();
  TextEditingController MobilePhone = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Country = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  FocusNode? _focusNodePassword;
  FocusNode? _focusNodeConfirmPassword;
  late String mobilePhone;
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isCheckAccepted = false;
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirstName.text = widget.firstName == null ? '': '${widget.firstName}';
    LastName.text = widget.lastName == null ? '': '${widget.lastName}';
    MobilePhone.text = widget.mobilePhone == null ? '': '${widget.mobilePhone}';
    Email.text = widget.email == null ? '': '${widget.email}';
    Country.text = widget.country == null ? '': '${widget.country}';
    State.text = widget.state == null ? '': '${widget.state}';
    Password.text = widget.password == null ? '': '${widget.password}';
    ConfirmPassword.text = widget.confirmPassword == null ? '': '${widget.confirmPassword}';


  }
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: Themes.whiteColor,
          width: Get.width,
          child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
            _handleLoginListener(context, state);
          }, builder: (context, state) {
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
                  'create_account'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: heightValue * 1.2,
                ),
                Form(
                  key: form,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        title: 'first_name',
                        keyboardType: TextInputType.text,
                        textEditingController: FirstName,
                      ),
                      SizedBox(
                        height: heightValue * 1,
                      ),
                      CustomTextFieldWidget(
                        title: 'last_name',
                        keyboardType: TextInputType.text,
                        textEditingController: LastName,
                      ),
                      SizedBox(
                        height: heightValue * 1,
                      ),
                      CustomTextFieldWidget(
                          title: 'mobile_number',
                          keyboardType: TextInputType.number,
                          textEditingController: MobilePhone,
                          maxLength: 11),
                      SizedBox(
                        height: heightValue * 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: CustomTextFieldWidget(
                                  title: 'country'.tr,
                                  keyboardType: TextInputType.text,
                                  textEditingController: Country)),
                          Expanded(
                              child: CustomTextFieldWidget(
                                  title: 'state'.tr,
                                  keyboardType: TextInputType.text,
                                  textEditingController: State)),
                        ],
                      ),
                      SizedBox(
                        height: heightValue * 1,
                      ),
                      ConditionWidget(
                        title: widget.choseService == null ? 'chose_service'.tr : '${widget.choseService}',
                        color: Themes.whiteColor,
                        textColor: Themes.ColorApp8,
                        onTap: () {
                          Get.to(ChoseTechnicalServiceScreen(
                            firstName: FirstName.text,lastName: LastName.text,country: Country.text, email: Email.text,
                            mobilePhone: MobilePhone.text,password: Password.text,state: State.text, choseService: widget.choseService,
                            choseServiceId: widget.choseServiceId,confirmPassword: ConfirmPassword.text,));
                        },
                      ),
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
                            FocusScope.of(context)
                                .requestFocus(_focusNodeConfirmPassword);
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
                          } else if (!(value.contains(Password.text))) {
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
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Themes.ColorApp1),
                                child: Checkbox(
                                    value: isCheckAccepted,
                                    tristate: false,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: const BorderSide(
                                        color: Themes.ColorApp1, width: 2.0),
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
                      state is LoginLoadingState
                          ? const CircularProgressIndicator(
                              color: Themes.ColorApp1,
                            )
                          : Container(),
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
                              if (form.currentState!.validate()) {
                                if (isCheckAccepted == true) {
                                  if(widget.choseService != null){
                                    print('choseServiceId');
                                    print(widget.choseServiceId);
                                    authCubit.setRegisterTechnical(
                                      context,
                                        FirstName.text,
                                        LastName.text,
                                        MobilePhone.text,
                                        Email.text,
                                        '${widget.choseServiceId}',
                                        Country.text,
                                        State.text,
                                        Password.text,
                                        '','1');
                                   // CustomFlutterToast('تم تسجيلك بنجاح');
                                  }else {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'خطأ',
                                      desc: 'من فصلك اختر الخدمة',
                                      btnCancelText: 'الغاء',
                                      btnOkText: 'موافق',
                                      btnCancelColor: Themes.ColorApp9,
                                      btnOkColor: Themes.ColorApp17,
                                      btnCancelOnPress: () {
                                        //  Navigator.pop(context);
                                      },
                                      btnOkOnPress: () {
                                        // Navigator.pop(context);
                                      },
                                    ).show();
                                  }
                                } else {
                                  CustomFlutterToast('agree_to_terms2'.tr);
                                }
                              }
                            }),
                      ),
                    ],
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
            );
          }),
        ),
      )),
    );
  }

  void _handleLoginListener(BuildContext context, AuthState state) {
    if (state is TechnicalRegisterErrorLoginState) {
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
        //  Navigator.pop(context);
        },
        btnOkOnPress: () {
      // Navigator.pop(context);
        },
      ).show();
    } else if (state is TechnicalRegisterSuccessState) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'تم تسجيل اشتراكك',
        desc: 'تم تسجيل اشتراكك . برجاء الانتظار لحين الاتصال بكم',
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
        btnCancelColor: Themes.ColorApp9,
        btnOkColor: Themes.ColorApp17,
        btnCancelOnPress: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (_) => false);
        },
        btnOkOnPress: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (_) => false);
        },
      ).show();
      _clearFormData();

    }
  }

  void _clearFormData() {
    FirstName.clear();
    LastName.clear();
    MobilePhone.clear();
    Email.clear();
    Password.clear();
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
          color: Themes.ColorApp7,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
