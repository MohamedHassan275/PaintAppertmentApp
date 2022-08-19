
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/UserScreens/home_main_screen/home_main_controller.dart';

import '../../../generated/assets.dart';
import '../../../utils/constant/Themes.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return GetBuilder<HomeMainController>(
      init: HomeMainController(),
      builder: (homeMainController)=> Scaffold(
        appBar: AppBar(
            backgroundColor: Themes.ColorApp1,
            toolbarHeight: 75,
            title: SizedBox(
              height: 75,
              child: Row(
                children: [
                  UserProfileWithNotification(heightValue: heightValue, widthValue: widthValue),
                ],
              ),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: [
              InkWell(
                  onTap: (){
                    // MyNavigator.NavigatorToPage(context, SearchSessionUserPage());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: CircleAvatar(
                      backgroundColor: Themes.whiteColor,
                      child: Center(
                          child: Icon(
                            Icons.notifications_none,
                            color: Themes.ColorApp1,
                          )),
                    ),
                  )
              )
            ]
        ),
        body: homeMainController.navigationItem[homeMainController.index],
        bottomNavigationBar: BottomNavigationBar(
          items: homeMainController.bottomNavigationBarItem,
          onTap: (value){
            setState(() {
              homeMainController.index = value;
            });
            homeMainController.navigationItem[homeMainController.index];
          },
          currentIndex: homeMainController.index,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Themes.ColorApp1),
          unselectedIconTheme: const IconThemeData(color: Themes.ColorApp11),
        ),
      ),
    );
  }
}

class UserProfileWithNotification extends StatelessWidget {
   UserProfileWithNotification(
      {Key? key, required this.heightValue, required this.widthValue}) : super(key: key);

 // ProfileUserResponseModel? profileUserResponseModel;
  double widthValue, heightValue;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'welcome_back'.tr,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: heightValue * .2,
              ),
              Row(
                children: const [
                   Text(
                     'محمود جمال',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ],
              )
            ],
          )
        ]);
  }
}
