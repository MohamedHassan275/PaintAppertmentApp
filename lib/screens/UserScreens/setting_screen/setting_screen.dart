
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_screen.dart';

import '../../../generated/assets.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/constant/Themes.dart';
import '../change_profile_user_screen/change_profile_user_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightValue * 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SettingCategory(
                                onTap: () {},
                                title: 'share_app'.tr,
                                imageTitle: Assets.iconsShare,
                                heightValue: heightValue),
                            SizedBox(
                              width: widthValue * 1.5,
                            ),
                            SettingCategory(
                                onTap: () => Get.to(const HomeMainScreen()),
                                title: 'terms_and_conditions'.tr,
                                imageTitle: Assets.iconsTermsConditionsImage,
                                heightValue: heightValue),
                            SizedBox(
                              width: widthValue * 1.5,
                            ),
                            SettingCategory(
                                onTap: () =>
                                    Get.to(const HomeMainScreen()),
                                title: 'privacy_policy'.tr,
                                imageTitle: Assets.imagesPrivacyImage,
                                heightValue: heightValue),
                          ],
                        ),
                        SizedBox(
                          height: heightValue * 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SettingCategory(
                            //     onTap: () {
                            //       Get.bottomSheet(
                            //         ChangeLanguageBottomSheetItem(heightValue: heightValue),
                            //         backgroundColor: Themes.whiteColor,
                            //         shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.only(
                            //                 topLeft: Radius.circular(25),
                            //                 topRight: const Radius.circular(
                            //                     25))),
                            //         elevation: 2.0,
                            //       );
                            //     },
                            //     title: 'language'.tr,
                            //     imageTitle: Assets.iconsLanguageImage,
                            //     heightValue: heightValue),
                            // SizedBox(
                            //   width: widthValue * 1.5,
                            // ),
                            SettingCategory(
                                onTap: () =>
                                    Get.off(const ChangeProfileUserScreen()),
                                title: 'profile_setting'.tr,
                                imageTitle: Assets.imagesProfileMenuIcon,
                                heightValue: heightValue),
                            SizedBox(
                              width: widthValue * 1.5,
                            ),
                            SettingCategory(
                                onTap: () => Get.to(const HomeMainScreen()),
                                title: 'about_app'.tr,
                                imageTitle: Assets.imagesAboutAppImage,
                                heightValue: heightValue),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightValue * 1,
                  ),
                  const Divider(height: 10, color: Themes.ColorApp8),
                  SizedBox(
                    height: heightValue * 1,
                  ),
                  ContactWithUs(
                      heightValue: heightValue, widthValue: widthValue),
                  SizedBox(height: heightValue * 1.5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'to_communicate_payment'.tr,
                          style: const TextStyle(
                            color: Themes.ColorApp8,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: heightValue*.5,),
                        const Text(
                          '011560333232',
                          style: TextStyle(
                            color: Themes.ColorApp1,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: heightValue*.5,),
                        const Text(
                          '011560333232',
                          style: TextStyle(
                            color: Themes.ColorApp1,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: heightValue*.5,),
                        const Text(
                          '011560333232',
                          style: TextStyle(
                            color: Themes.ColorApp1,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: heightValue * 1,),
                ],
              ),
            ),
          )),
    );
  }
}

class SettingCategory extends StatelessWidget {
  SettingCategory(
      {Key? key, required this.onTap,
        required this.title,
        required this.imageTitle,
        required this.heightValue}) : super(key: key);

  double? heightValue;
  String? imageTitle, title;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: 100,
                decoration: BoxDecoration(
                    color: Themes.ColorApp14,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Image.asset(imageTitle!, fit: BoxFit.contain)),
              ),
              SizedBox(
                height: heightValue! * .5,
              ),
              Text(
                title!,
                style: const TextStyle(
                  color: Themes.ColorApp8,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWithUs extends StatelessWidget {
  ContactWithUs({Key? key, required this.heightValue, required this.widthValue}) : super(key: key);

  double? heightValue, widthValue;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'to_communicate'.tr,
            style: const TextStyle(
              color: Themes.ColorApp8,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: heightValue! * 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactWithUsItem(
                imageTitle: Assets.iconsWhatsUpImage,
                onTap: () async{
                  bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

                  if (whatsapp) {
                    await FlutterLaunch.launchWhatsapp(
                        phone: '01099323104',message: '');
                  } else {
                    print("Whatsapp não instalado");
                  }
                },
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsInstagramImage,
                onTap: (){
                 // _launchURL(controller.settingResponseModel!.socialmedia![0].instagram)
                },
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsTwitterImage,
                onTap: () {
                  // _launchURL(controller.settingResponseModel!.socialmedia![0].twitter)
                },
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.imagesSnapshatImage,
                onTap: () {
                 // _launchURL(controller.settingResponseModel!.socialmedia![0].snapchat)
                } ,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ChangeLanguageBottomSheetItem extends StatefulWidget {
  double? heightValue;
  ChangeLanguageBottomSheetItem({Key? key, required this.heightValue}) : super(key: key);

  @override
  State<ChangeLanguageBottomSheetItem> createState() => _ChangeLanguageBottomSheetItemState();
}

class _ChangeLanguageBottomSheetItemState extends State<ChangeLanguageBottomSheetItem> {

  // changelanguage(String codeCountry){
  //   Locale myLocal = Locale(codeCountry);
  //   Get.find<StorageService>().activeLocale;
  //   Get.updateLocale(myLocal);
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 325,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                width: Get.width,
                height: 5,
                decoration: BoxDecoration(
                    color: Themes.ColorApp11,
                    borderRadius:
                    BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: widget.heightValue! * 2,
            ),
            Text(
              'chose_language'.tr,
              style: const TextStyle(
                color: Themes.ColorApp1,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: widget.heightValue! * 1,
            ),
            Column(
              children: <Widget>[
                CustomButtonImage(
                    title: 'arabic'.tr,
                    hight: 50,
                    onTap: (){
                      setState(() {
                        // changelanguage("ar");
                        // CustomFlutterToast(Get.find<StorageService>().GetLanguage);
                        // Get.find<LocalizationService>().toggleLocale('ar');
                        // Get.offAll(const SplashScreen());
                      });
                    }),
                SizedBox(height: widget.heightValue! * 1,),
                CustomButtonImage(
                    title: 'english'.tr,
                    hight: 50,
                    onTap: (){
                      setState(() {
                        // Get.find<LocalizationService>().toggleLocale('en');
                        // //  CustomFlutterToast(Get.find<StorageService>().GetLanguage);
                        // Get.offAll(const SplashScreen());
                      });
                    })
              ],
            ),
            SizedBox(
              height: widget.heightValue! * 1.5,
            ),
          ],
        ),
      ),
    );

  }
}




class ContactWithUsItem extends StatelessWidget {
  ContactWithUsItem({Key? key, required this.onTap, required this.imageTitle}) : super(key: key);

  String? imageTitle;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: Get.width,
          height: 75,
          decoration: BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.circular(15)),
          child: Center(child: Image.asset(imageTitle!, fit: BoxFit.contain)),
        ),
      ),
    );
  }
}

