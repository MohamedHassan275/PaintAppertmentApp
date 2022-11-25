import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/auth_cubit/auth_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/profile_cubit/profile_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/setting_cubit/setting_cubit.dart';
import 'package:pain_appertment/model/setting_model.dart';
import 'package:pain_appertment/screens/about_app_screen/about_app_screen.dart';
import 'package:pain_appertment/screens/privacy_screen/privacy_screen.dart';
import 'package:pain_appertment/screens/terms_condition_screen/terms_condition_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/assets.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/constant/Themes.dart';
import '../change_profile_user_screen/change_profile_user_screen.dart';
import '../my_notification_screen/my_notification_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  Future<void> share() async {
    await FlutterShare.share(
        title: 'مشاركة تطبيق شطب شقتك',
        text: 'شارك اصحابك ومعارفك التطبيق اللى هيريح ويسهل حياتهم من خلال طلب الخدمات من التطبيق بكل سهولة',
        linkUrl: "https://play.google.com/store/apps/details?id=" + 'com.elsareh.shatbShaqtek',
        chooserTitle: 'اختار صح');
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SettingCubit>(context).showUserDetails();
  }


  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          BlocProvider.of<SettingCubit>(context).showUserDetails();
        },
        child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: BlocBuilder<SettingCubit,SettingState>(
                  builder: (context, state) {
                    if( state is SettingSuccessfullyState){
                      var mobilePhoneList = '${state.settingResponseModel?.socialmedia![0].phoneNumbers}';
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: heightValue * 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: Get.width,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Themes.ColorApp14,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Themes.ColorApp1, width: 1.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BlocBuilder<ProfileCubit, ProfileState>(
                                      builder: (context, state) {
                                        if (state is ProfileSuccessState) {
                                          return SizedBox(
                                            height: 75,
                                            child:  Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    // onTap: () => PickImage(),
                                                    child: SizedBox(
                                                      width: 45,
                                                      height: 45,
                                                      child: CircleAvatar(
                                                        backgroundColor: Themes.whiteColor,
                                                        child: ClipOval(
                                                          child: Image.asset(
                                                            Assets.imagesLogoApp,
                                                            fit: BoxFit.contain,
                                                            height: 45,
                                                            width: 45,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  state is ProfileLoadingState
                                                      ? const CircularProgressIndicator(
                                                    color: Themes.ColorApp1,
                                                  )
                                                      : Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'welcome_back'.tr,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            color: Themes.ColorApp1),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${state.profileResponseModel?.firstname ?? ''} ${state.profileResponseModel?.lastname ?? ' '}',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Themes.ColorApp1),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ]),
                                          );
                                        } else if (state is ProfileErrorState) {
                                          return Container(
                                            child: Center(
                                              child: Text('${state.error}'),
                                            ),
                                          );
                                        }
                                        return Container(
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: Themes.ColorApp1,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Get.to(const MyNotificationScreen());
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(7.0),
                                          child: CircleAvatar(
                                            backgroundColor: Themes.ColorApp1,
                                            child: Center(
                                                child: Icon(
                                                  Icons.notifications_none,
                                                  color: Themes.whiteColor,
                                                )),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: heightValue * 1,
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
                                        onTap: () {
                                          share();
                                        },
                                        title: 'share_app'.tr,
                                        imageTitle: Assets.iconsShare,
                                        heightValue: heightValue),
                                    SizedBox(
                                      width: widthValue * 1.5,
                                    ),
                                    SettingCategory(
                                        onTap: () => Get.to(TermsConditionScreen(intentData: 'UserApp',
                                          titleAboutUs: state.settingResponseModel?.policy?.policy,)),
                                        title: 'terms_and_conditions'.tr,
                                        imageTitle: Assets.iconsTermsConditionsImage,
                                        heightValue: heightValue),
                                    SizedBox(
                                      width: widthValue * 1.5,
                                    ),
                                    SettingCategory(
                                        onTap: () => Get.to(PrivacyScreen(intentData: 'UserApp',
                                          titleAboutUs: state.settingResponseModel?.privacy?.privacy,)),
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
                                    SettingCategory(
                                        onTap: () => Get.to(AboutAppScreen(intentData: 'UserApp',
                                          titleAboutUs: state.settingResponseModel?.about?.about,)),
                                        title: 'about_app'.tr,
                                        imageTitle: Assets.imagesAboutAppImage,
                                        heightValue: heightValue),
                                    SizedBox(
                                      width: widthValue * 1.5,
                                    ),
                                    SettingCategory(
                                        onTap: (){
                                          BlocProvider.of<ProfileCubit>(context).showUserDetails();
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangeProfileUserScreen()));
                                        },
                                        title: 'profile_setting'.tr,
                                        imageTitle: Assets.imagesProfileMenuIcon,
                                        heightValue: heightValue),
                                    SizedBox(
                                      width: widthValue * 1.5,
                                    ),
                                    SettingCategory(
                                        onTap: () {
                                          BlocProvider.of<AuthCubit>(context).setLogout(context);
                                        },
                                        title: 'logout'.tr,
                                        imageTitle: Assets.iconsLanguageImage,
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
                              heightValue: heightValue, widthValue: widthValue, settingResponseModel: state.settingResponseModel,),
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
                                 Text(
                                  mobilePhoneList ==null ? 'لا يوجد ارقام حاليا' : mobilePhoneList,
                                  style: const TextStyle(
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
                      );
                    }else if (state is SettingErrorState){
                      return Container(
                        width: Get.width,
                        height: Get.height,
                        child:  Center(
                          child:Text('${state.error}'),
                        ),
                      );
                    }
                    return  Container(
                      width: Get.width,
                      height: Get.height,
                      child: const Center(
                        child: CircularProgressIndicator(color: Themes.ColorApp1,),
                      ),
                    );
                  },
                ),
              ),
            )),
      ),
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
  ContactWithUs({Key? key,required this.settingResponseModel, required this.heightValue, required this.widthValue}) : super(key: key);
  SettingResponseModel? settingResponseModel;
  double? heightValue, widthValue;

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


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
                        phone: '${settingResponseModel?.socialmedia![0].whatsapp}',message: '');
                  } else {
                    //print("Whatsapp não instalado");
                  }
                },
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsInstagramImage,
                onTap: (){
                  _launchURL(settingResponseModel?.socialmedia![0].instagram);
                },
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsTwitterImage,
                onTap: () {
                  _launchURL(settingResponseModel?.socialmedia![0].twitter);
                },
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.imagesFacebook,
                onTap: () async{
                  _launchURL(settingResponseModel?.socialmedia![0].facebook);
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

