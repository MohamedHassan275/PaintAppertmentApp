import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../business_logic/technical_controller/home_main_technical_cubit/home_main_technical_cubit.dart';
import '../../../business_logic/user_controller/profile_cubit/profile_cubit.dart';
import '../../../generated/assets.dart';
import '../../../utils/constant/Themes.dart';

class HomeTechincalMainScreen extends StatefulWidget {
  const HomeTechincalMainScreen({Key? key}) : super(key: key);

  @override
  _HomeTechincalMainScreenState createState() =>
      _HomeTechincalMainScreenState();
}

class _HomeTechincalMainScreenState extends State<HomeTechincalMainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfileCubit>(context, listen: false).showUserDetails();
  }
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return BlocBuilder<HomeMainTechnicalCubit,HomeMainTechnicalState>(builder: (context, state){
      HomeMainTechnicalCubit homeMainCubit = HomeMainTechnicalCubit.get(context);
      return  Scaffold(
        appBar: AppBar(
            backgroundColor: Themes.ColorApp1,
            toolbarHeight: 75,
            title: SizedBox(
              child:   BlocBuilder<ProfileCubit,ProfileState>(builder: (context, state) {
                if (state is ProfileSuccessState) {
                  return  SizedBox(
                    height: 75,
                    child: Row(
                      children: [
                        Row(
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
                                    children:  [
                                      Text(
                                        '${state.profileResponseModel?.firstname} ${state.profileResponseModel?.lastname}',
                                        style: TextStyle(fontSize: 13, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ])
                      ],
                    ),
                  );
                } else if (state is ProfileErrorState) {
                  return Container(
                    width: Get.width,
                    child: Center(
                      child: Text('${state.error}'),
                    ),
                  );
                }
                return Container(
                  width: Get.width,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Themes.ColorApp1,
                    ),
                  ),
                );

              },),
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
        body: homeMainCubit.screenList[homeMainCubit.index],
        bottomNavigationBar: BottomNavigationBar(
          items: homeMainCubit.navigationList,
          unselectedFontSize: 13,
          selectedFontSize: 13,
          currentIndex: homeMainCubit.index,
          onTap: (index){
            setState(() {
              homeMainCubit.index = index;
            });
            homeMainCubit.screenList[homeMainCubit.index];
          },
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Themes.ColorApp1),
          unselectedIconTheme: const IconThemeData(color: Themes.ColorApp11),
        ),
      );
    });

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
