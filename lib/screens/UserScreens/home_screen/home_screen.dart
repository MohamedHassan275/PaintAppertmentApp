import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/home_cubit/home_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/profile_cubit/profile_cubit.dart';
import 'package:pain_appertment/model/home_model.dart';
import 'package:pain_appertment/screens/UserScreens/details_service_image_screen/details_service_image_screen.dart';
import 'package:pain_appertment/screens/UserScreens/details_service_screen/details_service_screen.dart';
import 'package:pain_appertment/screens/UserScreens/request_my_service_screen/request_my_service_screen.dart';
import 'package:pain_appertment/utils/constant/Themes.dart';
import 'package:pain_appertment/utils/constant/constant.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/assets.dart';
import '../../../utils/constant/custom_toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('token is ${AppConstants.tokenSession}');
    setState(() {
      loadData();
    });
  }

  loadData() {
    BlocProvider.of<HomeCubit>(context, listen: false).getHomeUser();
    BlocProvider.of<ProfileCubit>(context, listen: false).showUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var height = Get.height * 0.024;
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        loadData();
        print('refresh');
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              HomeCubit homeCubit = HomeCubit.get(context);
              if (state is HomeSuccessState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 1.5,
                      ),
                      Card(
                        color: Themes.whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CarouselSlider(
                              items: state.homeResponseModel?.sliders
                                  ?.map((e) => ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child:
                                        FadeInImage(
                                          image: NetworkImage(
                                              '${e.image}'),
                                          height: 200,
                                          width: Get.width,
                                          fit: BoxFit.fill,
                                          placeholder:
                                          const AssetImage(Assets.imagesLoading),
                                        ),
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                height: 200,
                                aspectRatio: 2.0,
                                viewportFraction: 1.0,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(seconds: 1),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                scrollDirection: Axis.horizontal,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: height * 1,
                      ),
                      OrderPriceRequest(heightValue: height),
                      SizedBox(
                        height: height * 1,
                      ),
                      state.homeResponseModel!.categories!.isNotEmpty
                          ? SizedBox(
                              width: Get.width,
                              child: ListView.builder(
                                  itemCount: state
                                      .homeResponseModel!.categories!.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    Categories category = state
                                        .homeResponseModel!.categories![index];
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            // CustomFlutterToast(category.name);
                                            // print('service ${category.id}');
                                            // CustomFlutterToast(category.services![category.id!].name);
                                            // CustomFlutterToast(category.services![index].name);

                                            //   homeCubit.showProductDetails(category.services![index].id.toString());
                                            //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailsServiceScreen()));
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${state.homeResponseModel!.categories![index].name}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 19,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Themes.ColorApp15,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    // onTap: () => Get.to(DetailsServiceImageScreen(gallery: state.homeResponseModel?.gallery![index],)),
                                                    child: const Text(
                                                      '',
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        color:
                                                            Themes.ColorApp15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: height * .3,
                                              ),
                                              category.services!.isNotEmpty ?
                                              SizedBox(
                                                  height: 155,
                                                  width: Get.width,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: category
                                                          .services!.length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {

                                                            Get.to(DetailsServiceScreen(services: category.services![index],));
                                                          },
                                                          child: Card(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            color: Themes
                                                                .whiteColor,
                                                            elevation: 2,
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 0,
                                                                  vertical: 0),
                                                              child: SizedBox(
                                                                width: 175,
                                                                height: 155,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: const BorderRadius
                                                                              .only(
                                                                          topLeft: Radius.circular(
                                                                              15),
                                                                          topRight:
                                                                              Radius.circular(15)),
                                                                      child:
                                                                          FadeInImage(
                                                                        image: NetworkImage(
                                                                            '${category.services![index].image}'),
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        height:
                                                                            100,
                                                                        width: Get
                                                                            .width,
                                                                        placeholder:
                                                                            const AssetImage(Assets.imagesLoading),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: height * .5,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                      child: Text(
                                                                          '${category.services![index].name}',
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style:
                                                                        const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight.w400,
                                                                      fontSize:
                                                                          15,
                                                                      overflow:
                                                                          TextOverflow.fade,
                                                                      color:
                                                                          Themes.ColorApp8,
                                                                          ),
                                                                        ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: height * .5,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }))  : const Center(
                                                child: Text('لا يوجد خدامات حاليا'),
                                              ),
                                            ],
                                          ),
                                        ));
                                  }),
                            )
                          : const Center(
                              child: Text('لا يوجد اقسام حاليا'),
                            ),
                      SizedBox(
                        height: height * 1.5,
                      ),
                      state.homeResponseModel!.gallery!.isNotEmpty
                          ? SizedBox(
                              width: Get.width,
                              child: ListView.builder(
                                  itemCount:
                                      state.homeResponseModel!.gallery!.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    Gallery gallery = state
                                        .homeResponseModel!.gallery![index];
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            //  CustomFlutterToast('${homeUserResponseModel!.categories!.length}');
                                            // Get.to(const DetailsServiceScreen());
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${state.homeResponseModel!.gallery![index].title}',
                                                    maxLines: 3,
                                                    overflow: TextOverflow.fade,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      color: Themes.ColorApp15,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DetailsServiceImageScreen(
                                                                    gallery: state
                                                                        .homeResponseModel!
                                                                        .gallery![index],
                                                                  )));
                                                    },
                                                    child: const Text(
                                                      'المزيد',
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        color:
                                                            Themes.ColorApp15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: 150,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 3,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Card(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                                elevation: 2,
                                                                color: Themes
                                                                    .whiteColor,
                                                                child:
                                                                    Container(
                                                                  height: 150,
                                                                  width: 200,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    child:
                                                                        FadeInImage(
                                                                      image: NetworkImage(
                                                                          '${gallery.images![index].image}'),
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      height:
                                                                          150,
                                                                      width:
                                                                          200,
                                                                      placeholder:
                                                                          const AssetImage(
                                                                              Assets.imagesLoading),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ))),
                                            ],
                                          ),
                                        ));
                                  }),
                            )
                          : const Center(
                              child: Text('لا يوجد صور حاليا'),
                            ),
                      SizedBox(
                        height: height * 1.5,
                      ),
                      // CustomButtonImage(title: 'طلب خدمة ', hight: 50, onTap: ()=> Get.to(const RequestServiceScreen()))
                    ],
                  ),
                );
              } else if (state is HomeErrorState) {
                return Container(
                  width: Get.width,
                  height: Get.height,
                  child: const Center(
                    child: Text(''),
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
      ),
    ));
  }
}

class OrderPriceRequest extends StatelessWidget {
  OrderPriceRequest({required this.heightValue});

  double heightValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(RequestMyServiceScreen(
        companyId: '',
      )),
      child: Container(
        width: Get.width,
        height: 100,
        decoration: BoxDecoration(
          color: Themes.ColorApp14,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Themes.ColorApp1, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.imagesOrderPriceImage,
                    width: 35,
                    height: 35,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: heightValue * .3,
                  ),
                  Text(
                    'request_offer_price'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Themes.ColorApp8,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                color: Themes.whiteColor,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 25,
                        color: Themes.ColorApp1,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
