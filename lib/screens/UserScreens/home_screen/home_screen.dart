import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/business_logic/user_controller/home_cubit/home_cubit.dart';
import 'package:pain_appertment/business_logic/user_controller/profile_cubit/profile_cubit.dart';
import 'package:pain_appertment/model/home_model.dart';
import 'package:pain_appertment/screens/UserScreens/details_service_image_screen/details_service_image_screen.dart';
import 'package:pain_appertment/screens/UserScreens/details_service_screen/details_service_screen.dart';
import 'package:pain_appertment/utils/constant/Themes.dart';
import 'package:pain_appertment/utils/constant/constant.dart';

import '../../../generated/assets.dart';
import '../../../utils/constant/custom_toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('token is ${AppConstants.tokenSession}');
   setState(() {
     loadData();
   });
  }

  loadData() {
    BlocProvider.of<HomeCubit>(context, listen: false).getHomeUser();
    BlocProvider.of<ProfileCubit>(context, listen: false).showUserDetails();

    // BlocProvider.of<AddProductCubit>(context, listen: false)
    //     .getMyProducts(refresh: true);

    // BlocProvider.of<AddProductCubit>(context, listen: false)
    //     .getMyProductUser();

  }

  @override
  Widget build(BuildContext context) {
    var width = Get.width * 0.024;
    var height = Get.height * 0.024;
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: ()async {
            loadData();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: BlocBuilder<HomeCubit,HomeState>(
                  builder: (context, state) {
                    HomeCubit homeCubit = HomeCubit.get(context);
                    if(state is HomeSuccessState){
                      return  Padding(
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
                                    items: state.homeResponseModel?.sliders?.map((e) => Image(
                                      image: NetworkImage(e.image!),
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
                            state.homeResponseModel!.categories!.isNotEmpty ?
                            SizedBox(
                              width: Get.width,
                              child: ListView.builder(
                                  itemCount: state.homeResponseModel!.categories!.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                                        child: GestureDetector(
                                          onTap: (){
                                              CustomFlutterToast(state.homeResponseModel!.categories![index].services![index].id.toString());

                                            homeCubit.showProductDetails(state.homeResponseModel!.categories![index].services![index].id.toString());
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailsServiceScreen()));
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                children:  [
                                                  Text(
                                                    '${state.homeResponseModel!.categories![index].name}',
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 19,
                                                      overflow: TextOverflow.fade,
                                                      color: Themes.ColorApp15,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () => Get.to(DetailsServiceImageScreen(gallery: state.homeResponseModel?.gallery![index],)),
                                                    child: const Text(
                                                      'المزيد',
                                                      maxLines: 3,
                                                      overflow: TextOverflow.fade,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15,
                                                        overflow: TextOverflow.fade,
                                                        color: Themes.ColorApp15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: height * .3,),
                                              SizedBox(
                                                  height: 150,
                                                  width: Get.width,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 3,
                                                      scrollDirection: Axis.horizontal,
                                                      itemBuilder: (context, index){
                                                        List<Categories> categoriesList = state.homeResponseModel!.categories!;
                                                        Categories categories = state.homeResponseModel!.categories![index];
                                                        return Card(
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                          color: Themes.whiteColor,
                                                          elevation: 2,
                                                          child: Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                                            child: SizedBox(
                                                              width: 150,
                                                              height: 150,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                    child: FadeInImage(
                                                                      image: NetworkImage('${categoriesList[index].services![index].image}'),
                                                                      fit: BoxFit.fill,
                                                                      height: 100,
                                                                      width: 150,
                                                                      placeholder:  const AssetImage(Assets.imagesLogoApp),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: height * .5,
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      '${state.homeResponseModel!.categories![index].services![index].name}',
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
                                                        );
                                                      })),

                                            ],
                                          ),
                                        )
                                    );
                                  }),
                            ) :
                            const Center(
                              child: Text('not found'),
                            ),
                            SizedBox(height: height* 1.5,),
                            state.homeResponseModel!.gallery!.isNotEmpty ?
                            SizedBox(
                              width: Get.width,
                              child: ListView.builder(
                                  itemCount: state.homeResponseModel!.gallery!.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                                        child: GestureDetector(
                                          onTap: (){
                                            //  CustomFlutterToast('${homeUserResponseModel!.categories!.length}');
                                           // Get.to(const DetailsServiceScreen());
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    '${state.homeResponseModel!.gallery![index].title}',
                                                    maxLines: 3,
                                                    overflow: TextOverflow.fade,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 15,
                                                      overflow: TextOverflow.fade,
                                                      color: Themes.ColorApp15,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                          MaterialPageRoute(
                                                              builder: (
                                                                  context) =>
                                                                  DetailsServiceImageScreen(
                                                                    gallery: state
                                                                        .homeResponseModel!
                                                                        .gallery![index],)));
                                                    },
                                                    child: const Text(
                                                      'المزيد',
                                                      maxLines: 3,
                                                      overflow: TextOverflow.fade,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15,
                                                        overflow: TextOverflow.fade,
                                                        color: Themes.ColorApp15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: height* .7,),
                                              SizedBox(
                                                  height: 150,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 3,
                                                      scrollDirection: Axis.horizontal,
                                                      itemBuilder: (context, index) => Card(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(15),
                                                        ),
                                                        elevation: 2,
                                                        color: Themes.whiteColor,
                                                        child: Container(
                                                          height: 200,
                                                          width: 250,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(15),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(15),
                                                            child: FadeInImage(
                                                              image: NetworkImage('${state.homeResponseModel!.gallery![index].images![index].image}'),
                                                              fit: BoxFit.fill,
                                                              height: 100,
                                                              width: 150,
                                                              placeholder:  const AssetImage(Assets.imagesLogoApp),
                                                            ),
                                                          ),
                                                        ),
                                                      ))),
                                            ],
                                          ),
                                        )
                                    );
                                  }),
                            ) :
                            const Center(
                              child: Text('not found'),
                            ),
                            SizedBox(height: height* 1.5,),
                            // CustomButtonImage(title: 'طلب خدمة ', hight: 50, onTap: ()=> Get.to(const RequestServiceScreen()))
                          ],
                        ),
                      );
                    }else if (state is HomeErrorState){
                      return Container(
                        width: Get.width,
                        height: Get.height,
                        child:  Center(
                          child:Text('${state.error}'),
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
                  },),
            ),
          ),
        ));
  }
}
