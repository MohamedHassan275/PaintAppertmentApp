
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pain_appertment/screens/details_service_screen/details_service_screen.dart';
import 'package:pain_appertment/screens/my_order/my_current_order_screen/my_current_order_screen.dart';
import 'package:pain_appertment/screens/my_order/my_previous_order_screen/my_previous_order_screen.dart';
import 'package:pain_appertment/screens/my_order/my_waiting_order_screen/my_waiting_order_screen.dart';
import 'package:pain_appertment/screens/request_my_service_screen/request_my_service_screen.dart';
import 'package:pain_appertment/screens/setting_screen/setting_screen.dart';

import '../../utils/constant/Themes.dart';
import '../request_service_screen/request_service_screen.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Themes.ColorApp1,
            child: Column(
              children: <Widget>[
                Expanded(child: new Container()),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Themes.whiteColor,
                    labelColor: Themes.ColorApp1,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // Creates border
                        color: Themes.whiteColor),
                    tabs: [
                      Tab(text: 'request_offer_price2'.tr),
                      Tab(text: 'my_active_current'.tr),
                      Tab(text: 'my_previous_requests'.tr),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(children: <Widget>[
          MyWaitingOrderScreen(),
          MyCurrentOrderScreen(),
          MyPreviousOrderScreen(),
        ]),
      ),
    );
  }
}
