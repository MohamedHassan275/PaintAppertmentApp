import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import '../business_logic/app_layout_cubit/app_layout_cubit.dart';
import 'constant/Themes.dart';

class NoInternetConnectionScreen extends StatelessWidget {

  AppLayoutState appLayoutState;
  NoInternetConnectionScreen({Key? key,required this.appLayoutState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/network_dis_connection.png",
              height: 200,
              fit: BoxFit.contain,
              width: 200,
              color: Themes.ColorApp1,
            ),
            SizedBox(height: 15.h,),
            Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Themes.ColorApp1,
               child: Text(
                'أُووبس! الرجاء التحقق من اتصال الانترنت الخاص بك',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
            ),
             ),
            SizedBox(height: 5.h,),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(15),
            //     child: Shimmer.fromColors(
            //       baseColor: Colors.red,
            //       highlightColor: Themes.ColorApp19,
            //       child:  Text(
            //           LocaleKeys.internetConnection2.tr(),
            //           style: const TextStyle(
            //               color: Themes.ColorApp19,
            //               fontSize: 15.0,
            //               fontFamily: 'Poppins-Medium'),
            //           textAlign: TextAlign.center),
            //     ),
            //   ),
            // ),
            // appLayoutState is ConnectionSuccess ? Container(
            //   padding: EdgeInsets.only(
            //     bottom: Dimensions.paddingSizeDefault,
            //     right: Dimensions.paddingSizeDefault,
            //     left: Dimensions.paddingSizeDefault,
            //   ),
            //   child: CustomButton(
            //     buttonText: LocaleKeys.add.tr(),
            //     onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            //         MaterialPageRoute(builder: (context) => AppLayout()), (route) => false),
            //     height: 48.h,
            //     fontSize: Dimensions.fontSizeLarge,
            //   ),
            // ) : Container(),
          ],
        ),
      ),
    );
  }
}
