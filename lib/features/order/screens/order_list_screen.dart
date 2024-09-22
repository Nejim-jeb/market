import 'package:flutter/material.dart';
import 'package:flutter_grocery/common/widgets/app_bar_base_widget.dart';
import 'package:flutter_grocery/common/widgets/not_login_widget.dart';
import 'package:flutter_grocery/common/widgets/web_app_bar_widget.dart';
import 'package:flutter_grocery/features/auth/providers/auth_provider.dart';
import 'package:flutter_grocery/features/home/screens/bottom_nav_bar.dart';
import 'package:flutter_grocery/features/menu/screens/main_screen.dart';
import 'package:flutter_grocery/features/order/providers/order_provider.dart';
import 'package:flutter_grocery/features/order/widgets/order_widget.dart';
import 'package:flutter_grocery/helper/responsive_helper.dart';
import 'package:flutter_grocery/localization/app_localization.dart';
import 'package:flutter_grocery/localization/language_constraints.dart';
import 'package:flutter_grocery/utill/dimensions.dart';
import 'package:flutter_grocery/utill/styles.dart';
import 'package:provider/provider.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key, this.canPop}) : super(key: key);
  final bool? canPop;
  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    final bool isLoggedIn =
        Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
    Provider.of<OrderProvider>(context, listen: false)
        .changeActiveOrderStatus(true, isUpdate: false);

    if (isLoggedIn) {
      _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
      Provider.of<OrderProvider>(context, listen: false).getOrderList(context);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn =
        Provider.of<AuthProvider>(context, listen: false).isLoggedIn();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ResponsiveHelper.isMobilePhone()
          ? FloatingActionButton(
              elevation: 2,
              onPressed: () => drawerKey.currentState!.openDrawer(),
            )
          : const SizedBox.shrink(),
      bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 2),
      appBar: ResponsiveHelper.isMobilePhone()
          ? null
          : (ResponsiveHelper.isDesktop(context)
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(120),
                  child: WebAppBarWidget(),
                )
              : widget.canPop == false
                  ? null
                  : const AppBarBaseWidget()) as PreferredSizeWidget?,
      body: isLoggedIn
          ? Consumer<OrderProvider>(builder: (context, orderProvider, child) {
              return Column(
                children: [
                  ResponsiveHelper.isDesktop(context)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimensions.paddingSizeExtraLarge),
                          child: Text("my_orders".tr,
                              style: poppinsSemiBold.copyWith(
                                  fontSize: Dimensions.fontSizeLarge)),
                        )
                      : const SizedBox(),
                  Center(
                    child: TabBar(
                      onTap: (int? index) =>
                          orderProvider.changeActiveOrderStatus(index == 0),
                      tabAlignment: TabAlignment.center,
                      controller: _tabController,
                      labelColor: Theme.of(context).textTheme.bodyLarge!.color,
                      indicatorColor: Theme.of(context).primaryColor,
                      indicatorWeight: 3,
                      unselectedLabelStyle: poppinsRegular.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: Dimensions.fontSizeSmall),
                      labelStyle: poppinsMedium.copyWith(
                          fontSize: Dimensions.fontSizeSmall),
                      tabs: [
                        Tab(text: getTranslated('ongoing', context)),
                        Tab(text: getTranslated('history', context)),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: _tabController,
                    children: const [
                      OrderWidget(isRunning: true),
                      OrderWidget(isRunning: false),
                    ],
                  )),
                ],
              );
            })
          : const NotLoggedInWidget(),
    );
  }
}
