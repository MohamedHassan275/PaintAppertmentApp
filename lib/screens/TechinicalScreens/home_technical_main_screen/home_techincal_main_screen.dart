import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/my_notification_technical_screen/my_notification_technical_screen.dart';

import '../../../business_logic/app_layout_cubit/app_layout_cubit.dart';
import '../../../business_logic/technical_controller/home_main_technical_cubit/home_main_technical_cubit.dart';
import '../../../business_logic/user_controller/profile_cubit/profile_cubit.dart';
import '../../../generated/assets.dart';
import '../../../utils/constant/Themes.dart';
import '../../../utils/constant/constant.dart';
import '../../../utils/constant/custom_toast.dart';
import '../../../utils/no_internet.dart';
import '../../../utils/servies/storage_service.dart';
import '../../../utils/widget/custom_circler_progress_indicator_widget.dart';

class HomeTechincalMainScreen extends StatefulWidget {
  const HomeTechincalMainScreen({Key? key}) : super(key: key);

  @override
  _HomeTechincalMainScreenState createState() =>
      _HomeTechincalMainScreenState();
}

class _HomeTechincalMainScreenState extends State<HomeTechincalMainScreen> with WidgetsBindingObserver {

  Future<void> setupInteractedMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      if (message.data['type'] == 'Renew') {
        //  OrdersCubit.get(context).getAllOrders();
        if (message.notification!.body != null) {
          Get.offAll(const HomeTechincalMainScreen());
        } else {
          CustomFlutterToast('Du hast eine neue Bestellung');

        }
      }

      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        if (message.data['type'] == 'Renew') {
          //  OrdersCubit.get(context).getAllOrders();
          if (message.notification!.body != null) {
            Get.offAll(const HomeTechincalMainScreen());
          } else {
            CustomFlutterToast('Du hast eine neue Bestellung');
          }
        }
      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppConstants.tokenSession = Get.find<StorageService>().getToken != null ? AppConstants.tokenSession = Get.find<StorageService>().getToken : '';
    //print('token is ${AppConstants.tokenSession}');
    BlocProvider.of<ProfileCubit>(context, listen: false).showUserDetails();

    FirebaseMessaging.instance.getInitialMessage();

    //FCM messages
    setupInteractedMessage();

    WidgetsBinding.instance.addObserver(this);

  }
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: BlocConsumer<AppLayoutCubit, AppLayoutState>(
          listener: (context, state) {
            if (state is ConnectionSuccess) {
              // loadData();
              // loadDataProduct();
              // loadDataProfile();
              //print("success service");
              AppLayoutCubit appLayoutCubit = AppLayoutCubit.get(context);
              AnnotatedRegion<SystemUiOverlayStyle>(
                value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                ),
                child: BlocBuilder<HomeMainTechnicalCubit,HomeMainTechnicalState>(builder: (context, state){
                  HomeMainTechnicalCubit homeMainCubit = HomeMainTechnicalCubit.get(context);
                  return  WillPopScope(
                    onWillPop: () async{
                      await showDialog<bool>(
                        context: context,
                        builder: (c) => AlertDialog(
                          title: const Text('ملاحظة'),
                          content: const Text('هل تود الخروج من التطبيق'),
                          actions: [
                            IconButton(
                              icon: const Text('نعم'),
                              onPressed: () => Navigator.pop(c, true),
                            ),
                            IconButton(
                              icon: const Text('لا'),
                              onPressed: () => Navigator.pop(c, false),
                            ),
                          ],
                        ),
                      );
                      return false;
                    },
                    child: Scaffold(
                      // appBar: AppBar(
                      //     backgroundColor: Themes.ColorApp1,
                      //     toolbarHeight: 75,
                      //     title: SizedBox(
                      //       child: BlocBuilder<ProfileCubit,ProfileState>(builder: (context, state) {
                      //         if (state is ProfileSuccessState) {
                      //           return  SizedBox(
                      //             height: 75,
                      //             child: Row(
                      //               children: [
                      //                 Row(
                      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                     children: [
                      //                       GestureDetector(
                      //                         // onTap: () => PickImage(),
                      //                         child: SizedBox(
                      //                           width: 45,
                      //                           height: 45,
                      //                           child: CircleAvatar(
                      //                             backgroundColor: Themes.whiteColor,
                      //                             child: ClipOval(
                      //                               child: Image.asset(
                      //                                 Assets.imagesLogoApp,
                      //                                 fit: BoxFit.contain,
                      //                                 height: 45,
                      //                                 width: 45,
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       const SizedBox(
                      //                         width: 15,
                      //                       ),
                      //                       state is ProfileLoadingState ?
                      //                       const CircularProgressIndicator(
                      //                         color: Themes.whiteColor,
                      //                       ) :
                      //                       Column(
                      //                         mainAxisAlignment: MainAxisAlignment.center,
                      //                         crossAxisAlignment: CrossAxisAlignment.start,
                      //                         children: [
                      //                           Text(
                      //                             'welcome_back'.tr,
                      //                             style: const TextStyle(fontSize: 15, color: Colors.white),
                      //                           ),
                      //                           SizedBox(
                      //                             height: heightValue * .2,
                      //                           ),
                      //                           Row(
                      //                             children:  [
                      //                               Text(
                      //                                 '${state.profileResponseModel?.firstname ?? ' '} ${state.profileResponseModel?.lastname ?? ' '}',
                      //                                 style: TextStyle(fontSize: 13, color: Colors.white),
                      //                               ),
                      //                             ],
                      //                           )
                      //                         ],
                      //                       )
                      //                     ])
                      //               ],
                      //             ),
                      //           );
                      //         } else if (state is ProfileErrorState) {
                      //           return Container(
                      //             width: Get.width,
                      //             child: Center(
                      //               child: Text('${state.error}'),
                      //             ),
                      //           );
                      //         }
                      //         return Container(
                      //           width: Get.width,
                      //           child: const Center(
                      //             child: CircularProgressIndicator(
                      //               color: Themes.ColorApp1,
                      //             ),
                      //           ),
                      //         );
                      //
                      //       },),
                      //     ),
                      //     leading: Builder(
                      //       builder: (context) => IconButton(
                      //         icon: const Icon(
                      //           Icons.menu,
                      //           color: Colors.white,
                      //         ),
                      //         onPressed: () => Scaffold.of(context).openDrawer(),
                      //       ),
                      //     ),
                      //     actions: [
                      //       InkWell(
                      //           onTap: (){
                      //             Get.to(const MyNotificationTechnicalScreen());
                      //           },
                      //           child: const Padding(
                      //             padding: EdgeInsets.all(7.0),
                      //             child: CircleAvatar(
                      //               backgroundColor: Themes.whiteColor,
                      //               child: Center(
                      //                   child: Icon(
                      //                     Icons.notifications_none,
                      //                     color: Themes.ColorApp1,
                      //                   )),
                      //             ),
                      //           )
                      //       )
                      //     ]
                      // ),
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
                    ),
                  );
                }),
              );
            } else if (state is ConnectionFailure) {
              NoInternetConnectionScreen(
                appLayoutState: state,
              );
            }else {
               Scaffold(
                  body: Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('شطب شقتك',
                            textStyle: const TextStyle(
                                fontSize: 20.0,
                                color: Themes.ColorApp1,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins-bold')),
                      ],
                      isRepeatingAnimation: true,
                      totalRepeatCount: 6,
                      onTap: () {},
                    ),
                  ));
            }
          }, builder: (context, state) {
        AppLayoutCubit appLayoutCubit = AppLayoutCubit.get(context);
        if (state is ConnectionFailure) {
          return NoInternetConnectionScreen(
            appLayoutState: state,
          );
        } else if (state is ConnectionSuccess) {
          return BlocBuilder<HomeMainTechnicalCubit,HomeMainTechnicalState>(builder: (context, state){
            HomeMainTechnicalCubit homeMainCubit = HomeMainTechnicalCubit.get(context);
            return  WillPopScope(
              onWillPop: () async{
                await showDialog<bool>(
                  context: context,
                  builder: (c) => AlertDialog(
                    title: const Text('ملاحظة'),
                    content: const Text('هل تود الخروج من التطبيق'),
                    actions: [
                      IconButton(
                        icon: const Text('نعم'),
                        onPressed: () => Navigator.pop(c, true),
                      ),
                      IconButton(
                        icon: const Text('لا'),
                        onPressed: () => Navigator.pop(c, false),
                      ),
                    ],
                  ),
                );
                return false;
              },
              child: Scaffold(
                // appBar: AppBar(
                //     backgroundColor: Themes.ColorApp1,
                //     toolbarHeight: 75,
                //     title: SizedBox(
                //       child:   BlocBuilder<ProfileCubit,ProfileState>(builder: (context, state) {
                //         if (state is ProfileSuccessState) {
                //           return  SizedBox(
                //             height: 75,
                //             child: Row(
                //               children: [
                //                 Row(
                //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       GestureDetector(
                //                         // onTap: () => PickImage(),
                //                         child: SizedBox(
                //                           width: 45,
                //                           height: 45,
                //                           child: CircleAvatar(
                //                             backgroundColor: Themes.whiteColor,
                //                             child: ClipOval(
                //                               child: Image.asset(
                //                                 Assets.imagesLogoApp,
                //                                 fit: BoxFit.contain,
                //                                 height: 45,
                //                                 width: 45,
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                       const SizedBox(
                //                         width: 15,
                //                       ),
                //                       state is ProfileLoadingState ?
                //                       const CircularProgressIndicator(
                //                         color: Themes.whiteColor,
                //                       ) :
                //                       Column(
                //                         mainAxisAlignment: MainAxisAlignment.center,
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'welcome_back'.tr,
                //                             style: const TextStyle(fontSize: 15, color: Colors.white),
                //                           ),
                //                           SizedBox(
                //                             height: heightValue * .2,
                //                           ),
                //                           Row(
                //                             children:  [
                //                               Text(
                //                                 '${state.profileResponseModel?.firstname ?? ' '} ${state.profileResponseModel?.lastname ?? ' '}',
                //                                 style: TextStyle(fontSize: 13, color: Colors.white),
                //                               ),
                //                             ],
                //                           )
                //                         ],
                //                       )
                //                     ])
                //               ],
                //             ),
                //           );
                //         } else if (state is ProfileErrorState) {
                //           return Container(
                //             width: Get.width,
                //             child: Center(
                //               child: Text('${state.error}'),
                //             ),
                //           );
                //         }
                //         return Container(
                //           width: Get.width,
                //           child: const Center(
                //             child: CircularProgressIndicator(
                //               color: Themes.ColorApp1,
                //             ),
                //           ),
                //         );
                //
                //       },),
                //     ),
                //     leading: Builder(
                //       builder: (context) => IconButton(
                //         icon: const Icon(
                //           Icons.menu,
                //           color: Colors.white,
                //         ),
                //         onPressed: () => Scaffold.of(context).openDrawer(),
                //       ),
                //     ),
                //     actions: [
                //       InkWell(
                //           onTap: (){
                //             Get.to(const MyNotificationTechnicalScreen());
                //           },
                //           child: const Padding(
                //             padding: EdgeInsets.all(7.0),
                //             child: CircleAvatar(
                //               backgroundColor: Themes.whiteColor,
                //               child: Center(
                //                   child: Icon(
                //                     Icons.notifications_none,
                //                     color: Themes.ColorApp1,
                //                   )),
                //             ),
                //           )
                //       )
                //     ]
                // ),
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
              ),
            );
          });
        } else {
          return Scaffold(
              body: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('شطب شقتك',
                        textStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Themes.ColorApp1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-bold')),
                  ],
                  isRepeatingAnimation: true,
                  totalRepeatCount: 6,
                  onTap: () {},
                ),
              ));
        }
      }),
    );

  }
}

