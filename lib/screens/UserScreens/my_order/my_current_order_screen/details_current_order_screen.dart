import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/add_order_cubit/add_order_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/add_rate_cubit/add_rate_cubit.dart';
import 'package:pain_appertment/model/MyWaitingOrderModel.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../generated/assets.dart';
import '../../../../model/order_model.dart';
import '../../../../utils/componant/CustomButtonWidget.dart';
import '../../../../utils/constant/Themes.dart';
import '../../../../utils/constant/custom_toast.dart';
import '../../../../utils/servies/storage_service.dart';
import '../../../../utils/widget/custom_circler_progress_indicator_widget.dart';
import '../../../../utils/widget/custom_phone_and_password_widget.dart';
import '../../home_main_screen/home_main_screen.dart';

class DetailsMyCurrentOrder extends StatefulWidget {
  DetailsMyCurrentOrder({Key? key,required this.newOrder}) : super(key: key);
  OrderResponseModel newOrder;

  @override
  State<DetailsMyCurrentOrder> createState() => _DetailsWaitingOrderScreenState();
}

class _DetailsWaitingOrderScreenState extends State<DetailsMyCurrentOrder> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(StorageService());

  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var rating = 0.0;
  TextEditingController rateTechnicalTextController = TextEditingController();
  TextEditingController rateTechnicalNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: BlocConsumer<AddRateCubit,AddRateState>(
              listener: (context, state) {
                _handleAddRateToTechnical(context,state);
              },
              builder: (context, state) {
                AddRateCubit addRateCubit = AddRateCubit.get(context);
                return Column(
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
                                    DetailsOrder(widthValue, 'type_of_casting'.tr, '${widget.newOrder.service ?? '----'}',''),
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
                                    DetailsOrder(widthValue, 'technical_name'.tr, '${widget.newOrder.technicalName}',''),
                                    SizedBox(
                                      height: heightValue * .7,
                                    ),
                                    DetailsOrder(widthValue, 'request_price'.tr, '${widget.newOrder.offerCost}','sar'.tr),
                                    SizedBox(
                                      height: heightValue * .7,
                                    ),
                                    DetailsOrder(widthValue, 'details'.tr, '${widget.newOrder.description}',''),
                                    SizedBox(
                                      height: heightValue * .7,
                                    ),
                                    // Container(
                                    //   height: 60,
                                    //   decoration: BoxDecoration(
                                    //       color: Themes.ColorApp14,
                                    //       borderRadius: BorderRadius.circular(25)
                                    //   ),
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.symmetric(horizontal: 10),
                                    //     child: Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       crossAxisAlignment: CrossAxisAlignment.center,
                                    //       children: [
                                    //         Text(
                                    //           'details'.tr,
                                    //           style: const TextStyle(
                                    //             fontWeight: FontWeight.w500,
                                    //             fontSize: 17,
                                    //             color: Themes.ColorApp17,
                                    //           ),
                                    //         ),
                                    //         SizedBox(width: widthValue * .2,),
                                    //         Expanded(
                                    //           child: Text(
                                    //             '${widget.newOrder.description ?? ''}',
                                    //             maxLines: 2,
                                    //             overflow: TextOverflow.ellipsis,
                                    //             style: const TextStyle(
                                    //               fontWeight: FontWeight.w500,
                                    //               fontSize: 15,
                                    //               color: Themes.ColorApp1,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: heightValue * .7,
                                    ),

                                    /// Rate technical from user
                                    // SizedBox(height: heightValue * .7,),
                                    // Form(
                                    //     key: formKey,
                                    //     child: Column(
                                    //       children: [
                                    //         SmoothStarRating(
                                    //           rating: rating,
                                    //           size: 30,
                                    //           starCount: 5,
                                    //           borderColor: Themes.ColorApp13,
                                    //           color: Themes.ColorApp13,
                                    //           onRatingChanged: (value) {
                                    //             setState(() {
                                    //               rating = value;
                                    //               print('rating');
                                    //               print(rating);
                                    //             });
                                    //           },
                                    //         ),
                                    //         // CustomTextFieldWidget(title: 'rate_technical', maxLength: 2,keyboardType: TextInputType.number,
                                    //         //     textEditingController: rateTechnicalNumberController),
                                    //         SizedBox(height: heightValue * 1.5,),
                                    //         CustomTextFieldWidget(title: 'rate_technical',keyboardType: TextInputType.text,
                                    //             textEditingController: rateTechnicalTextController),
                                    //         SizedBox(height: heightValue * .5,),
                                    //         state is AddRateLoadingState
                                    //             ? CirclerProgressIndicatorWidget(isLoading: true)
                                    //             : Container(),
                                    //         SizedBox(height: heightValue * .7,),
                                    //         CustomButtonImage(title: 'rate_technical'.tr, hight: 50, onTap: (){
                                    //           if(formKey.currentState!.validate()){
                                    //             // CustomFlutterToast(widget.newOrder.id.toString());
                                    //             // CustomFlutterToast(rateTechnicalTextController.text);
                                    //             // print('rating');
                                    //             // print(rating);
                                    //             addRateCubit.addRateToTechnicalFromUser(widget.newOrder.id.toString(), rating,
                                    //                 rateTechnicalTextController.text);
                                    //           }
                                    //         }),
                                    //         SizedBox(height: heightValue * 2,)
                                    //       ],
                                    //     )),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heightValue * 2,),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handleAddRateToTechnical(BuildContext context, AddRateState state) {
    if(state is AddRateErrorState){
      CustomFlutterToast(state.statusResponse);
    }else if(state is AddRateSuccessState){
      CustomFlutterToast(state.statusResponse);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeMainScreen()));
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
            onTap: () => Get.off(const HomeMainScreen()),
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
                  image: const AssetImage(Assets.iconsDistanceIcon),
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

  double widthValue;
  String title, details,title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title : ',
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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
