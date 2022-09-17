import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/previous_orders_cubit/previous_orders_cubit.dart';
import 'package:pain_appertment/screens/UserScreens/my_order/my_waiting_order_screen/details_waiting_order_screen.dart';
import 'package:pain_appertment/business_logic/user_controller/my_waiting_order_controller.dart';

import '../../../../business_logic/user_controller/current_orders_cubit/current_orders_cubit.dart';
import '../../../../business_logic/user_controller/orders_cubit/orders_cubit.dart';
import '../../../../generated/assets.dart';
import '../../../../model/MyWaitingOrderModel.dart';
import '../../../../model/order_model.dart';
import '../../../../utils/componant/LoadingWidget.dart';
import '../../../../utils/constant/Themes.dart';

class MyWaitingOrderScreen extends StatefulWidget {
  const MyWaitingOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyWaitingOrderScreen> createState() => _MyWaitingOrderScreenState();
}

class _MyWaitingOrderScreenState extends State<MyWaitingOrderScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<OrdersCubit>(context).getSenderOrderUser();
  }
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          print('refresh');
          BlocProvider.of<OrdersCubit>(context).getSenderOrderUser();
        },
        child: SafeArea(
            child: SingleChildScrollView(
              child: BlocBuilder<OrdersCubit,OrdersState>(
                builder: (context, state) {
                  if(state is OrdersSuccessfullyState){
                    OrdersCubit ordersCubit = OrdersCubit.get(context);
                    return state.orderResponseModel!.isNotEmpty ?
                    ListView.builder(
                      itemCount: state.orderResponseModel!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: MyWaitingOrderItem(MyNewOder: state.orderResponseModel![index],
                            heightValue: heightValue,widthValue: widthValue,),
                        );
                      },): NoItemOFList();
                  }else if (state is OrdersErrorState){
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
            )
        ),
      ),
    );
  }
  void loadData(){

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
    );
  }
}

class MyWaitingOrderItem extends StatelessWidget {
  MyWaitingOrderItem(
      {Key? key,
      required this.MyNewOder,
      required this.widthValue,
      required this.heightValue})
      : super(key: key);
  double heightValue, widthValue;
  OrderResponseModel MyNewOder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       // Get.to(DetailsWaitingOrderScreen(newOrder: MyNewOder,));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CompanyDetails(MyNewOder),
              SizedBox(
                height: heightValue * 1,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Divider(
                  height: 10,
                  color: Themes.ColorApp2,
                ),
              ),
              SizedBox(
                height: heightValue * .5,
              ),
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
                      '${MyNewOder.governorate} ${MyNewOder.city}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Themes.ColorApp15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                     Get.to(DetailsWaitingOrderScreen(orderResponseModel: MyNewOder,));
                  },
                  child: Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp14,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
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
              SizedBox(
                height: heightValue * 1,
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(
                width: widthValue * 1,
              ),
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
        ),
        SizedBox(
          height: heightValue * .5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Row(
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
                          SizedBox(
                            width: widthValue * .2,
                          ),
                          Text(
                            '${myCurrentOrderModel!.service ?? '----'}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Row(
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
                          SizedBox(
                            width: widthValue * .2,
                          ),
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
                    ),
                  ),
                  Text(
                    '#${myCurrentOrderModel!.orderNumber}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp2,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
