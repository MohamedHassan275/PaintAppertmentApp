import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/change_profile_technical_screen/change_profile_technical_screen.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';
import 'package:pain_appertment/screens/about_app_screen/about_app_screen.dart';
import 'package:pain_appertment/screens/privacy_screen/privacy_screen.dart';
import 'package:pain_appertment/utils/componant/LoadingWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../business_logic/user_controller/auth_cubit/auth_cubit.dart';
import '../../../business_logic/user_controller/profile_cubit/profile_cubit.dart';
import '../../../business_logic/user_controller/setting_cubit/setting_cubit.dart';
import '../../../generated/assets.dart';
import '../../../model/setting_model.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/constant/Themes.dart';
import '../../UserScreens/change_profile_user_screen/change_profile_user_screen.dart';
import '../../UserScreens/my_notification_screen/my_notification_screen.dart';
import '../../terms_condition_screen/terms_condition_screen.dart';

class  SettingTechnicalScreen extends StatefulWidget {
  const  SettingTechnicalScreen({Key? key}) : super(key: key);

  @override
  State<SettingTechnicalScreen> createState() => _SettingTechnicalScreenState();
}

class _SettingTechnicalScreenState extends State<SettingTechnicalScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SettingCubit>(context).showUserDetails();
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'مشاركة تطبيق شطب شقتك',
        text: 'شارك اصحابك ومعارفك التطبيق اللى هيريح ويسهل حياتهم من خلال طلب الخدمات من التطبيق بكل سهولة',
        linkUrl: "https://play.google.com/store/apps/details?id=" + 'com.elsareh.shatbShatek',
        chooserTitle: 'اختار صح');
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
                                        onTap: () => Get.to(TermsConditionScreen(intentData: 'TechnicalApp',
                                          titleAboutUs: state.settingResponseModel?.policy?.policy,)),
                                        title: 'terms_and_conditions'.tr,
                                        imageTitle: Assets.iconsTermsConditionsImage,
                                        heightValue: heightValue),
                                    SizedBox(
                                      width: widthValue * 1.5,
                                    ),
                                    SettingCategory(
                                        onTap: () => Get.to(PrivacyScreen(intentData: 'TechnicalApp',
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
                                        onTap: () => Get.to(AboutAppScreen(intentData: 'TechnicalApp',
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
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangeProfileTechnicalScreen()));
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
                                        imageTitle: Assets.imagesLogout,
                                        heightValue: heightValue),

                                  ],
                                ),
                              ],
                            ),
                          ),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: ()=>  BlocProvider.of<AuthCubit>(context).deleteAccount(context),
                                      child: SizedBox(
                                        height: 75,
                                        child:  Row(
                                            children: [
                                              Text(
                                                'delete_account'.tr,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Themes.ColorApp1),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () => BlocProvider.of<AuthCubit>(context).deleteAccount(context),
                                        child: const Padding(
                                          padding: EdgeInsets.all(7.0),
                                          child: CircleAvatar(
                                            backgroundColor: Themes.ColorApp1,
                                            child: Center(
                                                child: Icon(
                                                  Icons.delete_forever_rounded,
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
                                  mobilePhoneList =='null' ? 'لا يوجد ارقام حاليا' : mobilePhoneList,
                                  style: const TextStyle(
                                    color: Themes.ColorApp1,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SizedBox(height: heightValue*.5,),
                                // const Text(
                                //   '011560333232',
                                //   style: TextStyle(
                                //     color: Themes.ColorApp1,
                                //     fontSize: 17,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                // SizedBox(height: heightValue*.5,),
                                // const Text(
                                //   '011560333232',
                                //   style: TextStyle(
                                //     color: Themes.ColorApp1,
                                //     fontSize: 17,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(height: heightValue * 1,),
                        ],
                      );
                    }else if (state is SettingErrorState){
                      return LoadingWidget(data: state.error);
                    }
                    return  LoadingWidget(data: '');
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
      {required this.onTap,
        required this.title,
        required this.imageTitle,
        required this.heightValue});

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
  ContactWithUs({required this.heightValue, required this.widthValue,required this.settingResponseModel});

  double? heightValue, widthValue;
  SettingResponseModel? settingResponseModel;
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
            style: TextStyle(
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
                onTap: () {
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
  ChangeLanguageBottomSheetItem({required this.heightValue});

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
    return Container(
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
              style: TextStyle(
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
  ContactWithUsItem({required this.onTap, required this.imageTitle});

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


