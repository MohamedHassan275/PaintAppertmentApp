// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/home_cubit/home_cubit.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/screens/UserScreens/request_my_service_screen/request_my_service_screen.dart';
import 'package:pain_appertment/utils/componant/CustomButtonWidget.dart';
import 'package:pain_appertment/utils/constant/custom_toast.dart';
import 'package:pain_appertment/utils/constant/style.dart';
import 'package:readmore/readmore.dart';

import '../../../model/home_model.dart';
import '../../../utils/constant/Themes.dart';
import '../home_main_screen/home_main_screen.dart';

class DetailsServiceScreen extends StatefulWidget {
  DetailsServiceScreen({Key? key,required this.services}) : super(key: key);
  Services? services;

  @override
  State<DetailsServiceScreen> createState() => _DetailsServiceScreenState();
}

class _DetailsServiceScreenState extends State<DetailsServiceScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).showProductDetails(widget.services!.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height * 0.024;
    var width = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Appbarwidget(
                  width: width,
                  height: height,
                  name: '${widget.services?.name}'),
              SizedBox(
                height: height * 1.5,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is ShowDetailsSuccessState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: FadeInImage(
                              height: 150,
                              width: Get.width,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  '${state.showProductResponseDetails?.image}'),
                              placeholder: const AssetImage(Assets.imagesLoading),
                            ),
                          ),
                        ),
                        // Image.asset(Assets.imagesLogoApp,
                        // height: 135,
                        // width: Get.width,
                        // fit: BoxFit.contain,),
                        SizedBox(
                          height: height * 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'اسم الخدمة : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                      color: Themes.ColorApp1,
                                    ),
                                  ),
                                  SizedBox(width: width * .3,),
                                  Expanded(
                                    child: Text(
                                      '${state.showProductResponseDetails?.name}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 1,
                              ),
                              const Text(
                                'تفاصيل الخدمة : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis,
                                  color: Themes.ColorApp1,
                                ),
                              ),
                              SizedBox(width: width * 1.5,),
                              ReadMoreText(
                                '${state.showProductResponseDetails?.about}',
                                trimLines: 2,
                                colorClickableText: Themes.ColorApp9,
                                trimMode: TrimMode.Length,
                                trimCollapsedText: 'عرض المزيد',
                                trimExpandedText: 'عرض أقل',
                                style: const TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                height: height * 1,
                              ),
                              const Text(
                                ' صور الخدمة ',
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  overflow: TextOverflow.fade,
                                  color: Themes.ColorApp1,
                                ),
                              ),
                              SizedBox(
                                height: height * 1,
                              ),
                              state.showProductResponseDetails!.images!.isEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'لا يوجد صور في الوقت الحالي ',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            overflow: TextOverflow.fade,
                                            color: Themes.ColorApp15,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(
                                      height: 215,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: state.showProductResponseDetails?.images!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                elevation: 2,
                                                color: Themes.whiteColor,
                                                child: Container(
                                                  height: 200,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(15),
                                                    child: FadeInImage(
                                                      height: 200,
                                                      width: 300,
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage('${state.showProductResponseDetails?.images![index].image}'),
                                                      placeholder: const AssetImage(Assets.imagesLoading),
                                                    ),
                                                  ),
                                                ),
                                              ),)),
                              SizedBox(
                                height: height * 1,
                              ),
                              const Text(
                                'تقييمات العميل',
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  overflow: TextOverflow.fade,
                                  color: Themes.ColorApp1,
                                ),
                              ),
                              SizedBox(
                                height: height * 1,
                              ),
                              state.showProductResponseDetails!.rates!.isEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'لا يوجد تقييمات في الوقت الحالي ',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            overflow: TextOverflow.fade,
                                            color: Themes.ColorApp15,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(
                                      height: 215,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state
                                            .showProductResponseDetails
                                            ?.rates!
                                            .length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) => Card(
                                          elevation: 3,
                                          color: Themes.whiteColor,
                                          child: Container(
                                            height: 200,
                                            width: 200,
                                            color: Themes.whiteColor,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${state.showProductResponseDetails?.rates![index].name}',
                                                  maxLines: 3,
                                                  overflow: TextOverflow.fade,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    overflow: TextOverflow.fade,
                                                    color: Themes.ColorApp15,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * .5,
                                                ),
                                                Text(
                                                  '${state.showProductResponseDetails?.rates![index].date}',
                                                  maxLines: 3,
                                                  overflow: TextOverflow.fade,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    overflow: TextOverflow.fade,
                                                    color: Themes.ColorApp15,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * .5,
                                                ),
                                                StarRating(
                                                  color: Themes.ColorApp13,
                                                  onRatingChanged: (rating) => state
                                                      .showProductResponseDetails
                                                      ?.rates![index]
                                                      .rate = rating,
                                                  rating: double.parse(
                                                      '${state.showProductResponseDetails?.rates![index].rate!}'),
                                                ),
                                                SizedBox(
                                                  height: height * .5,
                                                ),
                                                Text(
                                                  '${state.showProductResponseDetails?.rates![index].comment!}',
                                                  maxLines: 3,
                                                  overflow: TextOverflow.fade,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    overflow: TextOverflow.fade,
                                                    color: Themes.ColorApp15,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 1.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: height * 3.5,
                              ),
                              CustomButtonImage(
                                  title: 'request_price2'.tr,
                                  hight: 50,
                                  onTap: () {
                                    //  CustomFlutterToast(state.showProductResponseDetails?.id.toString());
                                    Get.to(RequestMyServiceScreen(
                                      companyId: state
                                          .showProductResponseDetails?.id
                                          .toString(),
                                    ));
                                  }),
                              SizedBox(
                                height: height * 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (state is ShowDetailsErrorState) {
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Appbarwidget extends StatelessWidget {
  Appbarwidget(
      {Key? key, required this.width, required this.height, required this.name})
      : super(key: key);
  double height, width;
  String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 75,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                color: Themes.ColorApp15,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 1.2,
          left: width * 1.5,
          child: GestureDetector(
            onTap: () => Get.off(const HomeMainScreen()),
            child: const CircleAvatar(
              backgroundColor: Themes.ColorApp5,
              child: Icon(
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

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  const StarRating(
      {Key? key,
      this.starCount = 5,
      this.rating = .0,
      this.onRatingChanged,
      this.color})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: 17,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: 17,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
        size: 17,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
