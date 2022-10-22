
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/technical_controller/add_price_order/add_price_order_cubit.dart';
import 'package:pain_appertment/screens/TechinicalScreens/home_technical_main_screen/home_techincal_main_screen.dart';
import 'package:pain_appertment/utils/constant/style.dart';

import '../../../../generated/assets.dart';
import '../../../../model/MyWaitingOrderModel.dart';
import '../../../../model/order_model.dart';
import '../../../../utils/componant/CustomButtonWidget.dart';
import '../../../../utils/componant/CustomTextFieldWidget.dart';
import '../../../../utils/constant/Themes.dart';
import '../../../../utils/constant/custom_toast.dart';
import '../../../../utils/widget/custom_circler_progress_indicator_widget.dart';
import '../../../../utils/widget/custom_phone_and_password_widget.dart';
import '../../../UserScreens/home_main_screen/home_main_screen.dart';

class DetailsNewOrderTechnicalScreen extends StatefulWidget {
   DetailsNewOrderTechnicalScreen({Key? key,required this.newOrder}) : super(key: key);
   OrderResponseModel newOrder;

  @override
  State<DetailsNewOrderTechnicalScreen> createState() => _DetailsNewOrderTechnicalScreenState();
}

class _DetailsNewOrderTechnicalScreenState extends State<DetailsNewOrderTechnicalScreen> {


  TextEditingController valueOrder = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AddPriceOrderCubit,AddPriceOrderState>(
            listener: (context, state) {
              _handleOrderListener(context, state);
            },
            builder: (context, state) {
              AddPriceOrderCubit addPriceOrderCubit = AddPriceOrderCubit.get(context);
              return Container(
                width: Get.width,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppbarDetailsOrder(widthValue, heightValue),
                        SizedBox(
                          height: heightValue * 1.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AddressDetailsOrder(newOrder: widget.newOrder,),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  const Divider(
                                    height: 10,
                                    color: Themes.ColorApp2,
                                  ),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'order_number'.tr, '#${widget.newOrder.orderNumber}',''),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'type_of_casting'.tr, '${widget.newOrder.service ?? '-----'}',''),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'quantity'.tr, '${widget.newOrder.flatArea}','متر'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'mix_type'.tr, '${widget.newOrder.rooms}','غرفة نوم'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'cement_type'.tr, '${widget.newOrder.bathrooms}','حمام'),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  DetailsOrder(widthValue, 'name_client'.tr, '${widget.newOrder.firstname} ${widget.newOrder.lastname}',''),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'order_details'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Themes.ColorApp8,
                                        ),
                                      ),
                                      SizedBox(
                                        width: widthValue * .5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget.newOrder.description  == null? 'لا يوجد تفاصيل للطلب' : '${widget.newOrder.description}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Themes.ColorApp1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: heightValue * .7,
                                  ),
                                  SizedBox(height: heightValue * .7,),
                                  Form(
                                    key: addPriceOrderCubit.fromKey,
                                    child: FromTextShared2(
                                        labelText: 'value_order'.tr,
                                        onChanged: (value) {
                                          value = value;
                                        },
                                        onSaved: (String? value){
                                          value = value!;
                                        },
                                        onTapValidator: (value) {
                                          if (value!.isEmpty) {
                                            return 'must_not_empty'.tr;
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        Controller: valueOrder,
                                        hintText: 'value_order'.tr),
                                  ),
                                  SizedBox(height: heightValue * .5,),
                                  state is AddPriceOrderLoadingState ?
                                  CirclerProgressIndicatorWidget(isLoading:  true) :
                                      Container(),
                                  SizedBox(height: heightValue * .7,),
                                  CustomButtonImage(title: 'button_value_order'.tr, hight: 50, onTap: (){
                                    if(addPriceOrderCubit.fromKey.currentState!.validate()){
                                      if(widget.newOrder.offer == 1){
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.warning,
                                          animType: AnimType.rightSlide,
                                          title: 'عرض سعر الخدمة',
                                          desc: 'لقد قمت بعرض السعر لهذه الخدمة',
                                          btnCancelText: 'الغاء',
                                          btnOkText: 'موافق',
                                          btnCancelColor: Themes.ColorApp9,
                                          btnOkColor: Themes.ColorApp17,
                                          btnCancelOnPress: () {
                                           // Navigator.pop(context);
                                          },
                                          btnOkOnPress: () {
                                        //    Navigator.pop(context);
                                          },
                                        ).show();
                                      }else if(widget.newOrder.offer == 0){
                                        addPriceOrderCubit.addPriceOfferOrderTechnical(context,widget.newOrder.id.toString(), valueOrder.text);
                                      }
                                    }
                                  }),
                                  SizedBox(height: heightValue * 1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heightValue * 2,),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleOrderListener(BuildContext context, AddPriceOrderState state) {
    if (state is AddPriceOrderErrorState) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'عرض سعر الخدمة',
        desc: state.statusResponse,
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
        btnCancelColor: Themes.ColorApp9,
        btnOkColor: Themes.ColorApp17,
        btnCancelOnPress: () {
        //  Navigator.pop(context);
        },
        btnOkOnPress: () {
        //  Navigator.pop(context);
        },
      ).show();
    } else if (state is AddPriceOrderSuccessfullyState) {

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'عرض سعر الخدمة',
        desc: state.statusResponse,
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
        btnCancelColor: Themes.ColorApp9,
        btnOkColor: Themes.ColorApp17,
        btnCancelOnPress: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeTechincalMainScreen()),
                  (_) => false);
        },
        btnOkOnPress: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeTechincalMainScreen()),
                  (_) => false);
        },
      ).show();

    }
  }

}

class AppbarDetailsOrder extends StatelessWidget {
  AppbarDetailsOrder(this.widthValue,this.heightValue);
  double heightValue,widthValue;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: 119,
          decoration: const BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35))),
          child: Center(
            child: Text(
              'contract_details'.tr,
              style: const TextStyle(
                color: Themes.ColorApp15,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: heightValue * 2.3,
          left: heightValue * 1.5,
          child: GestureDetector(
            onTap: () => Get.off(const HomeTechincalMainScreen()),
            child: const CircleAvatar(
              backgroundColor: Themes.ColorApp5,
              child: Icon(
                // Get.find<StorageService>().activeLocale.languageCode == "en"
                //     ? Icons.keyboard_arrow_right
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddressDetailsOrder extends StatelessWidget {
  AddressDetailsOrder({required this.newOrder});

  OrderResponseModel newOrder;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Themes.ColorApp14,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Image(
                  image:  AssetImage(Assets.iconsDistanceIcon),
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${newOrder.governorate} ${newOrder.city}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class DetailsOrder extends StatelessWidget {
  DetailsOrder(this.widthValue,this.title,this.details,this.title2);

  late double widthValue;
  late String title, details,title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title : ',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp8,
          ),
        ),
        SizedBox(
          width: widthValue * .5,
        ),
        Text(
          details,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp1,
          ),
        ),
        SizedBox(
          width: widthValue * .5,
        ),
        Text(
          title2,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Themes.ColorApp1,
          ),
        ),
      ],
    );
  }
}


