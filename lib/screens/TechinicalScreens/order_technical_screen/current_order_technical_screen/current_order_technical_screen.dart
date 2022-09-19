
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/technical_controller/current_technical_orders_cubit/current_technical_orders_cubit.dart';
import 'package:pain_appertment/model/order_model.dart';
import 'package:pain_appertment/screens/TechinicalScreens/order_technical_screen/current_order_technical_screen/details_current_order_technical_screen.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/componant/LoadingWidget.dart';
import '../../../../utils/constant/Themes.dart';

class CurrentOrderTechnicalScreen extends StatefulWidget {
  const CurrentOrderTechnicalScreen({Key? key}) : super(key: key);

  @override
  State<CurrentOrderTechnicalScreen> createState() => _CurrentOrderTechnicalScreenState();
}

class _CurrentOrderTechnicalScreenState extends State<CurrentOrderTechnicalScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CurrentTechnicalOrdersCubit>(context).getCurrentTechnicalOrderUser();
  }
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<CurrentTechnicalOrdersCubit,CurrentOrdersTechnicalState>(builder: (context, state) {
              CurrentTechnicalOrdersCubit currentOrdersCubit = CurrentTechnicalOrdersCubit.get(context);
              if(state is CurrentOrdersSuccessfullyState){
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
              }else if(state is CurrentOrdersErrorState){
                return LoadingWidget(data: state.error);
              }
              return LoadingWidget(data: '');
            },),)
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
                      width: 15,
                      height: 15,
                      child: CircleAvatar(
                        backgroundColor: Themes.ColorApp13,
                      ),
                    ),
                    SizedBox(width: widthValue * 1,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'address'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp2,
                            ),
                          ),
                          SizedBox(width: widthValue * .7,),
                          const Text(
                            'القاهرة مدينة نصر',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: widthValue * 1,),
                    // Text(
                    //   '${currentOrder.offerCost}',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 14,
                    //     color: Themes.ColorApp1,
                    //   ),
                    // ),
                    // SizedBox(width: widthValue * .5,),
                    // Text(
                    //   'sar'.tr,
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 14,
                    //     color: Themes.ColorApp1,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: heightValue * 1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: (){
                    Get.to(DetailsCurrentOrderTechnicalScreen(newOrder: currentOrder));
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
                        'order_details'.tr,
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
                        image: AssetImage(Assets.imagesFactoryNamIcon),
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
                '${myCurrentOrderModel!.orderNumber}#',
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    '${myCurrentOrderModel!.service ?? '---'}',
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
                ],
              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  const Text(
                    'محمد احمد',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: heightValue * .7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'mobile_number'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp2,
                    ),
                  ),
                  SizedBox(width: widthValue * .5,),
                  const Text(
                    '0115604362',
                    style: TextStyle(
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

class $ {
}



