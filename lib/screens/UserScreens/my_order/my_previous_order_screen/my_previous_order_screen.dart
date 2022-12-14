
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_previous_order_screen/details_previous_order_screen.dart';
import '../../../../business_logic/user_controller/previous_orders_cubit/previous_orders_cubit.dart';
import '../../../../business_logic/user_controller/profile_cubit/profile_cubit.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/constant/Themes.dart';
import '../../my_notification_screen/my_notification_screen.dart';

class MyPreviousOrderScreen extends StatefulWidget {
  const MyPreviousOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyPreviousOrderScreen> createState() => _MyPreviousOrderScreenState();
}

class _MyPreviousOrderScreenState extends State<MyPreviousOrderScreen> {
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          loadData();
        },
        child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: BlocBuilder<PreviousOrdersCubit,PreviousOrdersState>(
                    builder: (context, state) {
                      if(state is PreviousOrdersSuccessfullyState){
                        return state.orderResponseModel!.isNotEmpty ?
                        Column(
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
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  child: MyPreviousOrderItem(previousOrder: state.orderResponseModel![index],
                                      heightValue: heightValue, widthValue: widthValue),
                                );
                              },),
                          ],
                        ): NoItemOFList();
                      }else if (state is PreviousOrdersErrorState){
                        return Container(
                          width: Get.width,
                          height: Get.height,
                          child:  const Center(
                            child:Text(''),
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
              ),)
        ),
      ),
    );
  }

  void loadData(){
    BlocProvider.of<PreviousOrdersCubit>(context).getPreviousOrderUser();
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

class MyPreviousOrderItem extends StatelessWidget {
  MyPreviousOrderItem({Key? key,required this.previousOrder,required this.heightValue,required this.widthValue}) : super(key: key);
  double heightValue,widthValue;
  OrderResponseModel previousOrder;
  String? statusOrder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(DetailsPreviousOrderScreen(previousOrder: previousOrder,));
      },
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
              CompanyDetails(previousOrder),
              SizedBox(height: heightValue * 1,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Divider(height: 10, color: Themes.ColorApp8,),
              ),
              SizedBox(height: heightValue * .5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.iconsWalletMenuIcon,width: 15,height: 15,fit: BoxFit.contain,),
                        SizedBox(width: widthValue * .5,),
                        Text(
                          previousOrder.offerCost,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Themes.ColorApp1,
                          ),
                        ),
                        SizedBox(width: widthValue * .5,),
                        Text(
                          'sar'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Themes.ColorApp1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'received'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Themes.ColorApp1,
                          ),
                        ),
                        SizedBox(width: widthValue * .5,),
                        const Icon(Icons.subdirectory_arrow_left,color: Themes.ColorApp1,size: 25,),
                      ],
                    )
                  ],
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
              Image.asset(
                Assets.imagesOfferPrice,
                fit: BoxFit.contain,
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
