
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';

import '../../business_logic/user_controller/setting_cubit/setting_cubit.dart';
import '../../utils/constant/Themes.dart';
import '../UserScreens/home_main_screen/home_main_screen.dart';

class AboutAppScreen extends StatefulWidget {
   AboutAppScreen({Key? key,this.titleAboutUs,this.intentData}) : super(key: key);
   String? titleAboutUs;
   String? intentData;

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {

  String? nameTitle;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('intentData');
    print('${widget.intentData}');
    print('${widget.titleAboutUs}');
    BlocProvider.of<SettingCubit>(context).showUserDetails();
  }


  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    nameTitle = widget.titleAboutUs!.replaceAll('&nbsp;', '');
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          BlocProvider.of<SettingCubit>(context).showUserDetails();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Appbarwidget(width: widthValue, height: heightValue,intentData: widget.intentData),
                SizedBox(height: heightValue * 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("$nameTitle",
                    style: const TextStyle(
                      color: Themes.ColorApp1,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Appbarwidget extends StatelessWidget {
  Appbarwidget({Key? key, required this.width, required this.height,this.intentData}) : super(key: key);
  double height,width;
  String? intentData;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: 75,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.only(
                  topRight:  Radius.circular(25),
                  topLeft: Radius.circular(25))),
          child: const Center(
            child: Text(
              'عن التطبق',
              style: TextStyle(
                color: Themes.ColorApp15,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 1.2,
          left: width * 1.5,
          child: GestureDetector(
            onTap: () {
              if(intentData!.contains('UserApp')){
                Get.off(const HomeMainScreen());
              }else if(intentData!.contains('TechnicalApp')){
                Get.off(const HomeTechincalMainScreen());
              }
            },
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
