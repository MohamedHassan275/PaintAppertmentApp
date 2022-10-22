
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/TechinicalScreens/register_technical_screen/register_technical_screen.dart';

import '../../../business_logic/technical_controller/chose_technical_service_cubit/chose_technical_service_cubit.dart';
import '../../../generated/assets.dart';
import '../../../model/choose_service_model.dart';
import '../../../utils/constant/Themes.dart';


class ChoseTechnicalServiceScreen extends StatefulWidget {
  const ChoseTechnicalServiceScreen({Key? key,this.choseService,this.choseServiceId,this.firstName,this.mobilePhone,this.lastName,
    this.email,this.country,this.state,this.password,this.confirmPassword}) : super(key: key);
  final String? choseService,choseServiceId,firstName,mobilePhone,lastName,email,country,state,password,confirmPassword;




  @override
  _ChoseTechnicalServiceScreenState createState() => _ChoseTechnicalServiceScreenState();
}

class _ChoseTechnicalServiceScreenState extends State<ChoseTechnicalServiceScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ChoseTechnicalServiceCubit>(context).getChoseServiceTechnical();
  }
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
     body: RefreshIndicator(
       onRefresh: () async{
         BlocProvider.of<ChoseTechnicalServiceCubit>(context).getChoseServiceTechnical();
       },
       child: SafeArea(
           child: SingleChildScrollView(
             child: Container(
               child: Padding(
                 padding: const EdgeInsets.all(2.0),
                 child: Column(
                   children: [
                     Appbarwidget(width: widthValue, height: heightValue,firstName: widget.firstName,lastName: widget.lastName,country: widget.country,
                       email: widget.email,mobilePhone: widget.mobilePhone,password: widget.password,state: widget.state,
                       choseService: widget.choseService, confirmPassword: widget.confirmPassword,choseServiceId: widget.choseServiceId),
                     SizedBox(height: heightValue * .5,),
                     BlocBuilder<ChoseTechnicalServiceCubit,ChoseTechnicalServiceState>(
                       builder: (context, state) {
                         if(state is ChoseTechnicalServiceSuccessfullyState){
                           return state.choseServiceTechnical!.isNotEmpty ?
                           ListView.builder(
                             itemCount: state.choseServiceTechnical!.length,
                             shrinkWrap: true,
                             physics: const NeverScrollableScrollPhysics(),
                             itemBuilder: (context, index) {
                               return GestureDetector(
                                 onTap: (){
                                   Get.off(RegisterTechnicalScreen(choseService: state.choseServiceTechnical![index].name,
                                     choseServiceId: state.choseServiceTechnical![index].id.toString(),
                                     firstName: widget.firstName,lastName: widget.lastName,country: widget.country,
                                     email: widget.email,mobilePhone: widget.mobilePhone,
                                     password: widget.password,state: widget.state, confirmPassword: widget.confirmPassword,));
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Text(
                                         '${state.choseServiceTechnical![index].name}',
                                         style: const TextStyle(
                                           fontWeight: FontWeight.w500,
                                           fontSize: 15,
                                           color: Themes.ColorApp15,
                                         ),
                                       ),
                                       SizedBox(height: heightValue * 1,)
                                     ],
                                   ),
                                 ),
                               );
                             },) : NoItemOFList();
                         }else if (state is ChoseTechnicalServiceErrorState){
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

class ServiceTechnicalListItem extends StatelessWidget {
  const ServiceTechnicalListItem({Key? key,this.choseService,this.firstName,this.mobilePhone,this.lastName,
    this.email,this.country,this.state,this.password,this.confirmPassword,
    required this.heightValue, required this.widthValue, required this.chooseServiceResponseModel}) : super(key: key);
  final String? choseService,firstName,mobilePhone,lastName,email,country,state,password,confirmPassword;
 final double heightValue,widthValue;
 final ChooseServiceResponseModel chooseServiceResponseModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.off(RegisterTechnicalScreen(choseService: chooseServiceResponseModel.name,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${chooseServiceResponseModel.name}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Themes.ColorApp15,
              ),
            ),
            SizedBox(height: heightValue * 1,)
          ],
        ),
      ),
    );
  }
}

class Appbarwidget extends StatelessWidget {
  const Appbarwidget({Key? key,this.choseService,this.firstName,this.mobilePhone,this.lastName,this.choseServiceId,
    this.email,this.country,this.state,this.password,this.confirmPassword,required this.width,required this.height}) : super(key: key);
   final double height,width;
  final String? choseService,choseServiceId,firstName,mobilePhone,lastName,email,country,state,password,confirmPassword;
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
          child:   Center(
            child: Text(
              'chose_service'.tr,
              style: const TextStyle(
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
            onTap: () => Get.off(RegisterTechnicalScreen(firstName: firstName,lastName: lastName,country: country,
              email: email,mobilePhone: mobilePhone,password: password,state: state,
              choseService: choseService, confirmPassword: confirmPassword,)),
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
              'no_requests_service_have_added_before'.tr,
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
