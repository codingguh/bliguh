import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/appbar/tabbar.dart';
import 'package:bliguh/features/shop/screens/orders/widgets/order_card.dart';
import 'package:bliguh/features/shop/screens/orders/widgets/orders_tab.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            backgroundColor: TColors.secondGrey,
            appBar: TAppBar(
              title: Text('My Orders'),
              showBackArrow: true,
              isCenter: true,
              showBackground: true,
              bgColor: Colors.white,
              onTap: () {
                Get.back();
              },
            ),
            body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? TColors.black : Colors.white,
                    expandedHeight: 10,
                    bottom: TTabBar(tabs: [
                      Tab(
                        child: Text('To Pay'),
                      ),
                      Tab(
                        child: Text('To Ship'),
                      ),
                      Tab(
                        child: Text('To Received'),
                      ),
                      Tab(
                        child: Text('Completed'),
                      ),
                      Tab(
                        child: Text('Cancelled'),
                      ),
                    ]),
                  )
                ];
              },
              body: TabBarView(
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    OrderTab(child: OrderCard()),
                    OrderTab(child: OrderCard()),
                    OrderTab(
                        child: OrderCard(
                      status: 'To Received',
                    )),
                    OrderTab(
                        child: OrderCard(
                      status: 'Completed',
                    )),
                    OrderTab(
                        child: OrderCard(
                      status: 'Cancelled',
                    )),
                  ]),
            )));
  }
}
