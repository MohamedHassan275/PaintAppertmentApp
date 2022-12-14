
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pain_appertment/business_logic/technical_controller/current_technical_orders_cubit/current_technical_orders_cubit.dart';
import 'package:pain_appertment/business_logic/technical_controller/orders_technical_cubit/orders_technical_cubit.dart';
import 'package:pain_appertment/business_logic/technical_controller/previous_technical_orders_cubit/previous_technical_orders_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/current_orders_cubit/current_orders_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/previous_orders_cubit/previous_orders_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/profile_cubit/profile_cubit.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/utils/componant/LoadingWidget.dart';
import 'package:pain_appertment/utils/constant/constant.dart';
import 'package:pain_appertment/utils/constant/custom_toast.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/constant/Themes.dart';
import '../../../UserScreens/home_screen/home_screen.dart';
import '../../../UserScreens/my_notification_screen/my_notification_screen.dart';
import 'details_new_order_technical_screen.dart';

class NewOrderTechnicalScreen extends StatefulWidget {
  const NewOrderTechnicalScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderTechnicalScreen> createState() => _NewOrderTechnicalScreenState();
}

class _NewOrderTechnicalScreenState extends State<NewOrderTechnicalScreen> {

  final InAppReview _inAppReview = InAppReview.instance;
  Availability _availability = Availability.loading;

  void rateUser() async{
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print('tokenSession');
    //print(AppConstants.tokenSession);
    rateUser();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        setState(() {
          // This plugin cannot be tested on Android by installing your app
          // locally. See https://github.com/britannio/in_app_review#testing for
          // more information.
          _availability = isAvailable && !Platform.isAndroid
              ? Availability.available
              : Availability.unavailable;
        });
      } catch (e) {
        setState(() => _availability = Availability.unavailable);
      }
    });

    //print('token is ${AppConstants.tokenSession}');
    setState(() {
      loadData();
    });


  }

  void loadData(){
    BlocProvider.of<OrdersTechnicalCubit>(context).getNewTechnicalOrderUser();
    BlocProvider.of<CurrentTechnicalOrdersCubit>(context).getCurrentTechnicalOrderUser();
    BlocProvider.of<PreviousOrdersTechnicalCubit>(context).getPreviousTechnicalOrderUser();
    BlocProvider.of<ProfileCubit>(context).showUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return RefreshIndicator(
      onRefresh: () async{
        //print('refresh');
        //print('${AppConstants.typeSession}');
        loadData();

      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: BlocBuilder<OrdersTechnicalCubit,OrdersTechnicalState>(
                builder: (context, state) {
                  if(state is OrdersSuccessfullyState){
                    OrdersTechnicalCubit ordersCubit = OrdersTechnicalCubit.get(context);
                    if (state.orderResponseModel!.isNotEmpty) {
                      return Column(
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
                          ListView.builder(
                          itemCount: state.orderResponseModel!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                          return   Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            child: MySendOrderListItem(currentOrder: state.orderResponseModel![index],
                              heightValue: heightValue,widthValue: widthValue,),
                          );
                          },),
                        ],
                      );
                    }
                    else {
                      return NoItemOFList();
                    }
                  }else if (state is OrdersErrorState){
                    return LoadingWidget(data: state.error);
                  }
                  return  LoadingWidget(data: '');
                },
              ),
            )
        ),
      ),
    );
  }
}

class MySendOrderListItem extends StatelessWidget {
  MySendOrderListItem({Key? key,required this.currentOrder,required this.widthValue,required this.heightValue}) : super(key: key);
  double heightValue,widthValue;
  OrderResponseModel currentOrder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Get.to(DetailsSenderOrderScreen());
      // },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CompanyDetails(currentOrder),
              SizedBox(height: heightValue * 1,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Divider(height: 10, color: Themes.ColorApp8,),
              ),
              SizedBox(height: heightValue * .5,),
              currentOrder.offer == 1 ?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                      height: 15,
                      child:  CircleAvatar(
                        backgroundColor: Themes.ColorApp13,
                      ),
                    ),
                    SizedBox(
                      width: widthValue * 1,
                    ),
                    const Text(
                      '?????? ?????? ???????? ?????????? ???????? ????????????',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Themes.ColorApp9,
                      ),
                    ),
                  ],
                ),
              ) : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                      height: 15,
                      child:  CircleAvatar(
                        backgroundColor: Themes.ColorApp9,
                      ),
                    ),
                    SizedBox(
                      width: widthValue * 1,
                    ),
                    Text(
                      'waiting_send_offer_price'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Themes.ColorApp9,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: heightValue * 1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: (){
                    Get.to(DetailsNewOrderTechnicalScreen(newOrder: currentOrder));
                  },
                  child: Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp14,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child:  Text(
                        'order_details2'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Themes.ColorApp1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: heightValue * 1,)
            ],
          ),
        ),
      ),
    );
  }
}

class NoItemOFList extends StatelessWidget {
  NoItemOFList({Key? key}) : super(key: key);
  var widthValue = Get.width * 0.024;
  var heightValue = Get.height * 0.024;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              GestureDetector(
                // onTap: ()=> myOrderController.getMyOrderUser(),
                child: Image.asset(
                  Assets.imagesOfferPrice,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              Text(
                'no_requests_offers_have_added_before'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Themes.ColorApp8,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: heightValue * .7,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyDetails extends StatelessWidget {
  CompanyDetails(this.myCurrentOrderModel);

  OrderResponseModel? myCurrentOrderModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp14,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Image(
                        image: const AssetImage(Assets.imagesLogoApp),
                        fit: BoxFit.fill,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: widthValue *1,),
                  const Text(
                    '?????? ????????',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
              ),
              Text(
                '#${myCurrentOrderModel!.orderNumber}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Themes.ColorApp8,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: heightValue* .5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'request_type'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(width: widthValue * .5,),
              Text(
                myCurrentOrderModel!.service ?? '----',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp1,
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: heightValue * .3,),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'name_client'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Themes.ColorApp8,
                      ),
                    ),
                    SizedBox(width: widthValue * .5,),
                    Text(
                      ' : ${myCurrentOrderModel?.firstname} ${myCurrentOrderModel?.lastname}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Themes.ColorApp1,
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
        SizedBox(height: heightValue * .3,),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your_location'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Themes.ColorApp8,
                      ),
                    ),
                    SizedBox(width: widthValue * .5,),
                    Text(
                      '${myCurrentOrderModel?.governorate} - ${myCurrentOrderModel?.city}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Themes.ColorApp1,
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ],
    );
  }
}


