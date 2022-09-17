
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/home_main_cubit/home_main_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/home_cubit/home_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/profile_cubit/profile_cubit.dart';

import '../../../generated/assets.dart';
import '../../../utils/constant/Themes.dart';
import '../../../utils/constant/constant.dart';
import '../../../utils/servies/storage_service.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loadData();
      AppConstants.tokenSession = Get.find<StorageService>().GetToken != null ? AppConstants.tokenSession = Get.find<StorageService>().GetToken : '';
      print('token is ${AppConstants.tokenSession}');
    });
  }



  @override
  Widget build(BuildContext context) {
    final stateProfile = context.read<ProfileCubit>().state;
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return BlocBuilder<HomeMainCubit,HomeMainState>(builder: (context, state) {
      HomeMainCubit homeMainCubit = HomeMainCubit.get(context);
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Themes.ColorApp1,
            toolbarHeight: 75,
            title:
            BlocBuilder<ProfileCubit,ProfileState>(builder: (context, state) {
              if (state is ProfileSuccessState) {
                return     SizedBox(
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

            },),
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
        body: homeMainCubit.navigationItem[homeMainCubit.index],
        bottomNavigationBar: BottomNavigationBar(
          items: homeMainCubit.bottomNavigationBarItem,
          onTap: (value){
            setState(() {
              homeMainCubit.index = value;
            });
            homeMainCubit.navigationItem[homeMainCubit.index];
          },
          currentIndex: homeMainCubit.index,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Themes.ColorApp1),
          unselectedIconTheme: const IconThemeData(color: Themes.ColorApp11),
        ),
      );

    },);

  }
  loadData() {
    BlocProvider.of<HomeCubit>(context, listen: false).getHomeUser();
    BlocProvider.of<ProfileCubit>(context, listen: false).showUserDetails();
    // BlocProvider.of<AddProductCubit>(context, listen: false)
    //     .getMyProducts(refresh: true);

    // BlocProvider.of<AddProductCubit>(context, listen: false)
    //     .getMyProductUser();

  }
}


