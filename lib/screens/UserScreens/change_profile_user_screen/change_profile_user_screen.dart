// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';
import 'package:pain_appertment/utils/widget/custom_phone_and_password_widget.dart';

import '../../../generated/assets.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/componant/CustomTextFieldWidget.dart';
import '../../../utils/constant/Themes.dart';
import '../../../utils/widget/custom_circler_progress_indicator_widget.dart';

class ChangeProfileUserScreen extends StatefulWidget {
  const ChangeProfileUserScreen({Key? key}) : super(key: key);

  @override
  _ChangeProfileUserScreenState createState() =>
      _ChangeProfileUserScreenState();
}

class _ChangeProfileUserScreenState extends State<ChangeProfileUserScreen> {
  TextEditingController FirstName = new TextEditingController();
  TextEditingController LastName = new TextEditingController();
  TextEditingController MobilePhone = new TextEditingController();
  TextEditingController Email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = Get.height * 0.024;
    var width = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           Appbarwidget(width: width,height: height),
            SizedBox(
              height: height * 1.5,
            ),
            // controller.ProfileUserModel?.image != null ?
            // Stack(
            //         children: [
            //           image != null
            //               ? GestureDetector(
            //                   onTap: () => PickImage(),
            //                   child: ClipOval(
            //                     child: Image.file(
            //                       image!,
            //                       width: 137,
            //                       height: 137,
            //                       fit: BoxFit.fill,
            //                     ),
            //                   ),
            //                 ) :
            //           GestureDetector(
            //                   onTap: () => PickImage(),
            //                   child: ClipOval(
            //                     child: FadeInImage(
            //                       image: NetworkImage(
            //                           '${controller.ProfileUserModel!.image}'),
            //                       fit: BoxFit.fill,
            //                       height: 137,
            //                       width: 137,
            //                       placeholder: AssetImage(
            //                           Assets.imagesFactoryImage),
            //                     ),
            //                   ),
            //                 ),
            //           Positioned(
            //             bottom: heightValue * .3,
            //             right: widthValue * 1,
            //             child: Image.asset(
            //               Assets.imagesEditIamge,
            //               fit: BoxFit.cover,
            //               width: 35,
            //               height: 35,
            //             ),
            //           )
            //         ],
            //       ) :
            Stack(
              children: [
                // image != null
                //     ? GestureDetector(
                //   onTap: () => PickImage(),
                //         child: ClipOval(
                //           child: Image.file(
                //             image!,
                //             width: 137,
                //             height: 137,
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //       ) :
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
                // Positioned(
                //   bottom: heightValue * .3,
                //   right: widthValue * 1,
                //   child: Image.asset(
                //     Assets.imagesEditIamge,
                //     fit: BoxFit.cover,
                //     width: 35,
                //     height: 35,
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: height * 1.5,
            ),
            UserDetailsWidget(
              heightValue: height,
              widthValue: width,
              FirstName: FirstName,
              LastName: LastName,
              Email: Email,
              MobilePhone: MobilePhone,
            ),
            SizedBox(
              height: height * 2.5,
            ),
            CirclerProgressIndicatorWidget(isLoading: false),
            SizedBox(
              height: height * 1,
            ),
            CustomButtonImage(
                title: 'save'.tr,
                hight: 50,
                onTap: () {
                  Get.to(const HomeMainScreen());
                  // Get.find<ProfileInformationController>().updateProfileUser(
                  //     FirstName.text.isEmpty ? controller.ProfileUserModel!.firstname : FirstName.text,
                  //     LastName.text.isEmpty ? controller.ProfileUserModel!.lastname : LastName.text,
                  //     EmailAddress.text.isEmpty ? controller.ProfileUserModel!.email :EmailAddress.text, '',
                  //     // image == null ? File(controller.ProfileUserModel!.image!.split('/').last) : image,
                  //     Get.find<StorageService>().GetToken);
                })
          ],
        ),
      ),
    );
  }
}

class Appbarwidget extends StatelessWidget {
  Appbarwidget({Key? key,required this.width, required this.height}) : super(key: key);
   double height,width;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: 119,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.only(
                  topRight:  Radius.circular(25),
                  topLeft: Radius.circular(25))),
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
          top: height * 2.3,
          left: width * 1.5,
          child: GestureDetector(
            onTap: () => Get.off(const HomeMainScreen()),
            child: const CircleAvatar(
              backgroundColor: Themes.ColorApp5,
              child:  Icon(
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
  TextEditingController LastName =  TextEditingController();
  TextEditingController MobilePhone =  TextEditingController();
  TextEditingController Email =  TextEditingController();

  UserDetailsWidget(
      {Key? key, required this.FirstName,
      required this.LastName,
      required this.Email,
      required this.MobilePhone,
      required this.widthValue,
      required this.heightValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
