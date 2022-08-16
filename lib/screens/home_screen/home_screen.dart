import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/home_main_screen/home_main_screen.dart';
import 'package:pain_appertment/screens/home_screen/home_controller.dart';
import 'package:pain_appertment/screens/request_service_screen/request_service_screen.dart';
import 'package:pain_appertment/utils/componant/CustomButtonWidget.dart';
import 'package:pain_appertment/utils/constant/Themes.dart';

import '../../generated/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = Get.width * 0.024;
    var height = Get.height * 0.024;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (service) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: height * 1.5,),
                        Card(
                          color: Themes.whiteColor,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: CarouselSlider(
                                items: service.sliderModel.map((e) => Image(
                                  image: AssetImage(e.image),
                                  height: 200,
                                  fit: BoxFit.fill,
                                )).toList(),
                                options: CarouselOptions(
                                  height: 200,
                                  aspectRatio: 2.0,
                                  viewportFraction: 1.0,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration: const Duration(seconds: 1),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                )),
                          ),
                        ),
                        SizedBox(height: height * .5,),
                        Row(
                          children: const [
                            Text(
                              'خدامات الشركة',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                overflow: TextOverflow.fade,
                                color: Themes.ColorApp15,
                              ),
                            ),
                           Spacer(),
                            Text(
                              'المزيد',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                overflow: TextOverflow.fade,
                                color: Themes.ColorApp15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * .5,),
                        GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
                            itemCount: service.serviceCompanyModel.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 5),
                                  child: GestureDetector(
                                    onTap: (){
                                      //  CustomFlutterToast('${homeUserResponseModel!.categories!.length}');
                                    //  Get.to(CategoryDetailsScreen(categories: homeUserResponseModel!.categories![index],));
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Themes.ColorApp14,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: FadeInImage(
                                                image: AssetImage(service.serviceCompanyModel[index].image),
                                                fit: BoxFit.fill,
                                                height: 50,
                                                width: 50,
                                                placeholder:  const AssetImage(Assets.imagesLogoApp),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * .3,
                                            ),
                                            Expanded(
                                              child: Text(
                                                service.serviceCompanyModel[index].title,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  overflow: TextOverflow.fade,
                                                  color: Themes.ColorApp8,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                              );
                            }),
                        SizedBox(height: height * 1.5,),
                        CustomButtonImage(title: 'طلب خدمة ', hight: 50, onTap: ()=> Get.to(const RequestServiceScreen()))
                      ],
                    ),
                  ),),
          ),
        ));
  }
}
