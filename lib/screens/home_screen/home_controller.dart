
import 'package:get/get.dart';
import 'package:pain_appertment/generated/assets.dart';
import 'package:pain_appertment/model/service_company_model.dart';
import 'package:pain_appertment/model/slider_model.dart';

class HomeController extends GetxController {

 late bool isLoading = false;

 get isloading => isLoading;

 setLoading(bool loading){
   loading = isLoading;
   update();
 }

 RxList<SliderModel> sliderModel = [
   SliderModel(Assets.imagesLogoApp),
   SliderModel(Assets.imagesLogoApp),
   SliderModel(Assets.imagesLogoApp),
   SliderModel(Assets.imagesLogoApp),
   SliderModel(Assets.imagesLogoApp),
 ].obs;


 RxList<ServiceCompanyModel> serviceCompanyModel = [
   ServiceCompanyModel('كهرباء',Assets.imagesLogoApp),
   ServiceCompanyModel('تشطيب',Assets.imagesLogoApp),
   ServiceCompanyModel('سباكة',Assets.imagesLogoApp),
   ServiceCompanyModel('نقاشة',Assets.imagesLogoApp),
   ServiceCompanyModel('سيراميك',Assets.imagesLogoApp),
   ServiceCompanyModel('سيراميك',Assets.imagesLogoApp),
 ].obs;


}