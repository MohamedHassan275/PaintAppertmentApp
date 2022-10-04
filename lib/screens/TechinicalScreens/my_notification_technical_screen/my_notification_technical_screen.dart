
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/current_orders_cubit/current_orders_cubit.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_current_order_screen/details_current_order_screen.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/constant/Themes.dart';
import '../../../business_logic/notification_cubit/notification_cubit.dart';
import '../../../business_logic/user_controller/add_rate_cubit/add_rate_cubit.dart';
import '../../../utils/constant/custom_toast.dart';
import '../../../utils/widget/custom_phone_and_password_widget.dart';

class MyNotificationTechnicalScreen extends StatefulWidget {
  const MyNotificationTechnicalScreen({Key? key}) : super(key: key);

  @override
  State<MyNotificationTechnicalScreen> createState() => _MyNotificationTechnicalScreenState();
}

class _MyNotificationTechnicalScreenState extends State<MyNotificationTechnicalScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // loadData();
  }
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          BlocProvider.of<NotificationCubit>(context).getNotification();
        },
        child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Appbarwidget(width: widthValue, height: heightValue),
                      SizedBox(height: heightValue * .5,),
                      BlocBuilder<NotificationCubit,NotificationState>(
                        builder: (context, state) {
                          if(state is NotificationSuccessfullyState){
                            return state.orderResponseModel!.isNotEmpty ?
                            ListView.builder(
                              itemCount: state.orderResponseModel!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  child: MySendOrderListItem(currentOrder: state.orderResponseModel![index], heightValue: heightValue,widthValue: widthValue,),
                                );
                              },) : NoItemOFList();
                          }else if (state is NotificationErrorState){
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
                    ],
                  ),
                ),
              ),)
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
                child: Divider(height: 10, color: Themes.ColorApp2,),
              ),
              SizedBox(height: heightValue * .5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    const SizedBox(
                      child: Icon(
                        Icons.location_on,
                        color: Themes.ColorApp1,
                      ),
                    ),
                    SizedBox(
                      width: widthValue * .5,
                    ),
                    Text(
                      '${currentOrder.governorate} ${currentOrder.city}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Themes.ColorApp15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: heightValue * 1,),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: GestureDetector(
              //     onTap: (){
              //       Get.to(DetailsMyCurrentOrder(newOrder: currentOrder));
              //     },
              //     child: Container(
              //       width: Get.width,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: Themes.ColorApp14,
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       child: Center(
              //         child:  Text(
              //          currentOrder.status == 0 ? 'تقييم العامل' : 'قمت بتقيم هذا العامل',
              //           style: const TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 16,
              //             color: Themes.ColorApp1,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: heightValue * 1,)
            ],
          ),
        ),
      ),
    );
  }
}

class Appbarwidget extends StatelessWidget {
  Appbarwidget({Key? key, required this.width, required this.height}) : super(key: key);
  double height,width;
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
          child:  const Center(
            child: Text(
              'الاشعارات',
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
            onTap: () => Get.off(const HomeTechincalMainScreen()),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: heightValue * 2,
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
                        image: const AssetImage(Assets.imagesFactoryNamIcon),
                        fit: BoxFit.contain,
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  SizedBox(width: widthValue *1,),
                  const Text(
                    'شطب شقتك',
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
                  color: Themes.ColorApp2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: heightValue* .5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'request_type'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp2,
                    ),
                  ),
                  SizedBox(width: widthValue * .2,),
                  Text(
                    '${myCurrentOrderModel!.service ?? '----' }',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'quantity'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp2,
                    ),
                  ),
                  SizedBox(width: widthValue * .2,),
                  Text(
                    '${myCurrentOrderModel!.flatArea}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp1,
                    ),
                  ),
                  SizedBox(width: widthValue * .2,),
                  const Text(
                    'متر',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
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
                        color: Themes.ColorApp2,
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
      ],
    );
  }
}



