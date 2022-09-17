
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/add_order_cubit/add_order_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/profile_cubit/profile_cubit.dart';

import '../../../business_logic/user_controller/RequestMyServiceController.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/constant/Themes.dart';
import '../../../utils/widget/custom_circler_progress_indicator_widget.dart';
import '../../../utils/widget/custom_phone_and_password_widget.dart';

class RequestMyServiceScreen extends StatefulWidget {
   RequestMyServiceScreen({Key? key,required this.companyId}) : super(key: key);
   String? companyId;

  @override
  State<RequestMyServiceScreen> createState() => _RequestMyServiceScreenState();
}

class _RequestMyServiceScreenState extends State<RequestMyServiceScreen> {

  TextEditingController distanceAppermentController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController restRoomController = TextEditingController();
  TextEditingController governmentController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobilePhoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfileCubit>(context).showUserDetails();
  }

  @override
  Widget build(BuildContext context) {
   final stateProfile = context.watch<ProfileCubit>().state;
    var height = Get.height * 0.024;
    var width = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AddOrderCubit,AddOrderState>(builder: (context, state) {
          AddOrderCubit addOrderCubit = AddOrderCubit.get(context);
          if(stateProfile is ProfileSuccessState){
            firstNameController.text = stateProfile.profileResponseModel?.firstname ?? ' ';
            lastNameController.text = stateProfile.profileResponseModel?.lastname ?? ' ';
            mobilePhoneController.text = stateProfile.profileResponseModel?.phone ?? ' ';
            governmentController.text = stateProfile.profileResponseModel?.governorate ?? ' ';
            cityController.text = stateProfile.profileResponseModel?.city ?? ' ';
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: height * 1.5,),
                    const Text(
                      'طلب عرض سعر  لتكاليف شقتك',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        overflow: TextOverflow.fade,
                        color: Themes.ColorApp15,
                      ),
                    ),
                    SizedBox(height: height * 1.5,),
                    Row(
                      children: [
                        Expanded(child: CustomTextFieldWidget(title: 'first_name', keyboardType: TextInputType.text, textEditingController: firstNameController)),
                        Expanded(child: CustomTextFieldWidget(title: 'last_name', keyboardType: TextInputType.text, textEditingController: lastNameController)),
                      ],
                    ),
                    SizedBox(
                      height: height * 1,
                    ),
                    CustomTextFieldWidget(title: 'mobile_number', keyboardType: TextInputType.number, textEditingController: mobilePhoneController,maxLength: 11),
                    SizedBox(
                      height: height * 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: CustomTextFieldWidget(title: 'country', keyboardType: TextInputType.text,
                            textEditingController: governmentController)),
                        Expanded(child: CustomTextFieldWidget(title: 'state', keyboardType: TextInputType.text,
                            textEditingController: cityController)),
                      ],
                    ),
                    SizedBox(
                      height: height * 1,
                    ),
                    Row(
                      children: [
                        Expanded(child: CustomTextFieldWidget(title: 'distance_appertment', keyboardType: TextInputType.number, textEditingController: distanceAppermentController)),
                        Expanded(child: CustomTextFieldWidget(title: 'room_number', keyboardType: TextInputType.number, textEditingController: roomNumberController)),
                      ],
                    ),
                    SizedBox(
                      height: height * 1,
                    ),
                    CustomTextFieldWidget(title: 'rest_room', keyboardType: TextInputType.number, textEditingController: restRoomController),
                    SizedBox(
                      height: height * 1,
                    ),
                    CustomTextFieldWidget(title: 'details_service', keyboardType: TextInputType.text, textEditingController: restRoomController),
                    SizedBox(
                      height: height * 1,
                    ),
                    state is AddOrderLoadingState ?
                    CirclerProgressIndicatorWidget(isLoading: true) :
                    Container(),
                    SizedBox(height: height * 1,),
                    CustomButtonImage(title: 'request_price2', hight: 50, onTap: (){
                      if(formKey.currentState!.validate()){
                        addOrderCubit.addOrderUser('${widget.companyId}', distanceAppermentController.text,
                            roomNumberController.text, restRoomController.text, firstNameController.text,
                            lastNameController.text, mobilePhoneController.text,
                            governmentController.text, cityController.text);
                      }
                    }),
                    SizedBox(height: height * 1,),
                  ],
                ),
              ),
            );
          }
         return Container(
           width: Get.width,
           height: Get.height,
           child: const Center(
             child: CircularProgressIndicator(color: Themes.ColorApp1,),
           ),
         );
        },),
        ),

    );
  }
}
