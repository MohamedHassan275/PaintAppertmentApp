import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';
import 'package:pain_appertment/utils/widget/custom_phone_and_password_widget.dart';

import '../../../business_logic/user_controller/profile_cubit/profile_cubit.dart';
import '../../../generated/assets.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/componant/CustomTextFieldWidget.dart';
import '../../../utils/constant/Themes.dart';
import '../../../utils/constant/constant.dart';
import '../../../utils/constant/custom_toast.dart';
import '../../../utils/constant/style.dart';
import '../../../utils/widget/custom_circler_progress_indicator_widget.dart';

class ChangeProfileTechnicalScreen extends StatefulWidget {
  const ChangeProfileTechnicalScreen({Key? key}) : super(key: key);

  @override
  _ChangeProfileTechnicalScreenState createState() =>
      _ChangeProfileTechnicalScreenState();
}

class _ChangeProfileTechnicalScreenState extends State<ChangeProfileTechnicalScreen> {

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController mobilePhoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController governmentController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var height = Get.height * 0.024;
    var width = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            _handleLoginListener(context, state);
          },
          builder: (context, state) {
            ProfileCubit profileCubit = ProfileCubit.get(context);
            if (state is ProfileSuccessState) {
              firstNameController.text = state.profileResponseModel?.firstname ?? '';
              lastNameController.text = state.profileResponseModel?.lastname ?? '';
              mobilePhoneController.text = state.profileResponseModel?.phone ?? '';
              emailController.text = state.profileResponseModel?.email ?? '';
              governmentController.text = state.profileResponseModel?.governorate ?? '';
              cityController.text = state.profileResponseModel?.city ?? '';
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 1,
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          // onTap: () => PickImage(),
                          child: CircleAvatar(
                            backgroundColor: Themes.whiteColor,
                            radius: 75,
                            child: ClipOval(
                              child: Image.asset(
                                Assets.imagesLogoApp,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 1.5,
                    ),
                    UserDetailsWidget(
                      heightValue: height,
                      widthValue: width,
                      FirstName: firstNameController,
                      LastName: lastNameController,
                      Email: emailController,
                      MobilePhone: mobilePhoneController, formKey: formKey,
                      Country: governmentController, State: cityController,
                    ),
                    SizedBox(
                      height: height * .5,
                    ),
                    state is UpdateProfileLoadingState ?
                    CirclerProgressIndicatorWidget(isLoading: true) :
                         Container(),
                    SizedBox(
                      height: height * 1,
                    ),
                    CustomButtonImage(
                        title: 'save'.tr,
                        hight: 50,
                        onTap: () {
                          if(formKey.currentState!.validate()){
                            print('user details');
                            print(AppConstants.tokenSession);
                            print(firstNameController.text);
                            print(lastNameController.text);
                            print(mobilePhoneController.text);
                            print(emailController.text);
                            print(governmentController.text);
                            print(cityController.text);

                            profileCubit.updateProfileUser(firstNameController.text, lastNameController.text, mobilePhoneController.text,
                                emailController.text,
                                governmentController.text,cityController.text);
                          }
                        }),
                    SizedBox(height: height *1,)
                  ],
                ),
              );
            } else if (state is ProfileErrorState) {
              return Container(
                width: Get.width,
                height: Get.height,
                child: Center(
                  child: Text('${state.error}'),
                ),
              );
            }
            return Container(
              width: Get.width,
              height: Get.height,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Themes.ColorApp1,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleLoginListener(BuildContext context, ProfileState state) {
    if (state is ProfileErrorState) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'خطاء',
        desc: state.error,
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
        btnCancelColor: Themes.ColorApp9,
        btnOkColor: Themes.ColorApp17,
        btnCancelOnPress: () {
       //  Navigator.pop(context);
        },
        btnOkOnPress: () {
       //   Navigator.pop(context);
        },
      ).show();
    } else if (state is UpdateProfileSuccessState) {
    //  CustomFlutterToast(state.changeProfileSuccessfully);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'نجاح',
        desc: state.changeProfileSuccessfully,
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
        btnCancelColor: Themes.ColorApp9,
        btnOkColor: Themes.ColorApp17,
        btnCancelOnPress: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeTechincalMainScreen()),
                  (_) => false);
        },
        btnOkOnPress: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeTechincalMainScreen()),
                  (_) => false);
        },
      ).show();

    }
  }

  void _clearFormData() {
    firstNameController.clear();
    lastNameController.clear();
    mobilePhoneController.clear();
    emailController.clear();
    governmentController.clear();
    cityController.clear();
  }
}

class Appbarwidget extends StatelessWidget {
  Appbarwidget({Key? key, required this.width, required this.height})
      : super(key: key);
  double height, width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 75,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          child: Center(
            child: Text(
              'account_information'.tr,
              style: const TextStyle(
                color: Themes.ColorApp15,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 1.0,
          left: width * 1.5,
          child: GestureDetector(
            onTap: () => Get.off(const HomeMainScreen()),
            child: const CircleAvatar(
              backgroundColor: Themes.ColorApp5,
              child: Icon(
                // Get.find<StorageService>()
                //     .activeLocale
                //     .languageCode ==
                //     "en"
                //     ? Icons.keyboard_arrow_right:
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class UserDetailsWidget extends StatelessWidget {
  // ProfileUserResponseModel? profileUserResponseModel;
  double heightValue, widthValue;
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController MobilePhone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Country = TextEditingController();
  TextEditingController State = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  UserDetailsWidget(
      {Key? key,
        required this.formKey,
        required this.FirstName,
        required this.LastName,
        required this.Email,
        required this.MobilePhone,
        required this.Country,
        required this.State,
        required this.widthValue,
        required this.heightValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FromTextProfileShared(
                      labelText: 'first_name'.tr,
                      isPassword: false,
                      onTapValidator: (value) {
                        if (value!.isEmpty) {
                          return 'must_not_empty'.tr;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // profileUserResponseModel?.firstname= value;
                      },
                      keyboardType: TextInputType.text,
                      Controller: FirstName,
                      hintText: ''),
                ),
                SizedBox(
                  height: widthValue * 1.5,
                ),
                Expanded(
                  child: FromTextProfileShared(
                    labelText: 'last_name'.tr,
                    onTapValidator: (value) {
                      if (value!.isEmpty) {
                        return 'must_not_empty'.tr;
                      }
                      return null;
                    },
                    isPassword: false,
                    keyboardType: TextInputType.text,
                    Controller: LastName,
                    hintText: 'last_name'.tr,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: heightValue * 1,
          ),
          CustomTextFieldWidget(
              title: 'mobile_number',
              textEditingController: MobilePhone,
              keyboardType: TextInputType.number,
              maxLength: 11),
          SizedBox(
            height: heightValue * 1,
          ),
          FromTextRegisterShared(
              labelText: 'email_address'.tr,
              readOnly: false,
              onTapValidator: (value) {
                if (value!.isEmpty) {
                  return 'must_not_empty'.tr;
                } else if (!(value.contains("@"))) {
                  return 'not_valid'.tr;
                }
                return null;
              },
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              Controller: Email,
              hintText: 'email_address'.tr),
          SizedBox(
            height: heightValue * 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: CustomTextFieldWidget(
                      title: 'country',
                      keyboardType: TextInputType.text,
                      textEditingController: Country)),
              Expanded(
                  child: CustomTextFieldWidget(
                      title: 'state',
                      keyboardType: TextInputType.text,
                      textEditingController: State)),
            ],
          ),
        ],
      ),
    );
  }
}
