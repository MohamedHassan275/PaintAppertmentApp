import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/add_order_cubit/add_order_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/profile_cubit/profile_cubit.dart';
import '../../../utils/componant/CustomButtonWidget.dart';
import '../../../utils/constant/Themes.dart';
import '../../../utils/constant/custom_toast.dart';
import '../../../utils/widget/custom_circler_progress_indicator_widget.dart';
import '../../../utils/widget/custom_phone_and_password_widget.dart';
import '../home_main_screen/home_main_screen.dart';

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
  TextEditingController detailsOrderController = TextEditingController();
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
    return WillPopScope(
      onWillPop: () async{
        print('back screen');
        Get.to(const HomeMainScreen());
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AddOrderCubit,AddOrderState>(
            listener: (context, state) {
              _handleLoginListener(context, state);
            },
            builder: (context, state) {
            AddOrderCubit addOrderCubit = AddOrderCubit.get(context);
            if(stateProfile is ProfileSuccessState){
              firstNameController.text = stateProfile.profileResponseModel?.firstname ?? '';
              lastNameController.text = stateProfile.profileResponseModel?.lastname ?? '';
              mobilePhoneController.text = stateProfile.profileResponseModel?.phone ?? '';
              governmentController.text = stateProfile.profileResponseModel?.governorate ?? '';
              cityController.text = stateProfile.profileResponseModel?.city ?? '';
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
                      CustomTextFieldWidget(title: 'first_name', keyboardType: TextInputType.text, textEditingController: firstNameController),
                      SizedBox(
                        height: height * 1,
                      ),
                      CustomTextFieldWidget(title: 'last_name', keyboardType: TextInputType.text, textEditingController: lastNameController),
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
                          Expanded(child: CustomTextFieldWidget(title: 'distance_appertment', keyboardType: TextInputType.number,
                              textEditingController: distanceAppermentController)),
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
                      CustomTextFieldWidget(title: 'details_service', keyboardType: TextInputType.text, textEditingController: detailsOrderController),
                      SizedBox(
                        height: height * 1,
                      ),
                      state is AddOrderLoadingState ?
                      CirclerProgressIndicatorWidget(isLoading: true) :
                      Container(),
                      SizedBox(height: height * 1,),
                      CustomButtonImage(title: 'request_price2', hight: 50, onTap: (){
                        if(formKey.currentState!.validate()){
                          addOrderCubit.addOrderUser(context,'${widget.companyId}', distanceAppermentController.text,
                              roomNumberController.text, restRoomController.text, firstNameController.text,
                              lastNameController.text, mobilePhoneController.text,
                              governmentController.text, cityController.text,detailsOrderController.text);
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

      ),
    );
  }

  void _handleLoginListener(BuildContext context, AddOrderState state) {
    if (state is AddOrderErrorState) {
    //  CustomFlutterToast(state.addOrderStatus);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'خطأ',
        desc: state.addOrderStatus,
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
        btnCancelColor: Themes.ColorApp9,
        btnOkColor: Themes.ColorApp17,
        btnCancelOnPress: () {
          //Navigator.pop(context);
        },
        btnOkOnPress: () {
        //  Navigator.pop(context);
        },
      ).show();
    } else if (state is AddOrderSuccessfullyState) {
    //  CustomFlutterToast(state.addOrderStatus);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'نجاح',
        desc: state.addOrderStatus,
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
        btnCancelColor: Themes.ColorApp9,
        btnOkColor: Themes.ColorApp17,
        btnCancelOnPress: () {
          _clearFormData();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeMainScreen()),
                  (_) => false);
        },
        btnOkOnPress: () {
          _clearFormData();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeMainScreen()),
                  (_) => false);
        },
      ).show();

    }
  }

  void _clearFormData() {
    firstNameController.clear();
    lastNameController.clear();
    mobilePhoneController.clear();
    governmentController.clear();
    cityController.clear();
    distanceAppermentController.clear();
    roomNumberController.clear();
    restRoomController.clear();
    detailsOrderController.clear();
  }

}
