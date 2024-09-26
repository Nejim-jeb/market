import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery/common/enums/html_type_enum.dart';
import 'package:flutter_grocery/common/providers/cart_provider.dart';
import 'package:flutter_grocery/common/providers/theme_provider.dart';
import 'package:flutter_grocery/common/widgets/custom_pop_scope_widget.dart';
import 'package:flutter_grocery/common/widgets/third_party_chat_widget.dart';
import 'package:flutter_grocery/features/address/providers/location_provider.dart';
import 'package:flutter_grocery/features/address/screens/address_list_screen.dart';
import 'package:flutter_grocery/features/cart/screens/cart_screen.dart';
import 'package:flutter_grocery/features/coupon/screens/coupon_screen.dart';
import 'package:flutter_grocery/features/home/screens/home_screens.dart';
import 'package:flutter_grocery/features/html/screens/html_viewer_screen.dart';
import 'package:flutter_grocery/features/menu/domain/models/custom_drawer_controller_model.dart';
import 'package:flutter_grocery/features/menu/domain/models/main_screen_model.dart';
import 'package:flutter_grocery/features/menu/screens/menu_screen.dart';
import 'package:flutter_grocery/features/menu/screens/setting_screen.dart';
import 'package:flutter_grocery/features/notification/screens/notification_screen.dart';
import 'package:flutter_grocery/features/order/screens/order_list_screen.dart';
import 'package:flutter_grocery/features/profile/providers/profile_provider.dart';
import 'package:flutter_grocery/features/refer_and_earn/screens/refer_and_earn_screen.dart';
import 'package:flutter_grocery/features/splash/providers/splash_provider.dart';
import 'package:flutter_grocery/features/support/screens/support_screen.dart';
import 'package:flutter_grocery/features/wallet_and_loyalty/screens/loyalty_screen.dart';
import 'package:flutter_grocery/features/wallet_and_loyalty/screens/wallet_screen.dart';
import 'package:flutter_grocery/features/wishlist/screens/wishlist_screen.dart';
import 'package:flutter_grocery/helper/responsive_helper.dart';
import 'package:flutter_grocery/helper/route_helper.dart';
import 'package:flutter_grocery/localization/language_constraints.dart';
import 'package:flutter_grocery/main.dart';
import 'package:flutter_grocery/utill/dimensions.dart';
import 'package:flutter_grocery/utill/images.dart';
import 'package:flutter_grocery/utill/styles.dart';
import 'package:provider/provider.dart';

final drawerKey = GlobalKey<ScaffoldState>();

List<MenuScreensSection> menuSections = [
  MenuScreensSection(
    title: 'Home',
    screens: [
      MainScreenModel(const HomeScreen(), 'home', Images.homeSolid),
      MainScreenModel(
          const NotificationScreen(
            canPop: false,
          ),
          'notifications',
          Images.notification),
      MainScreenModel(
          const OrderListScreen(canPop: false), 'my_order', Images.ordersSolid),
      MainScreenModel(const WishListScreen(canPop: false), 'favourite',
          Images.favoriteSolid),
      if (Provider.of<SplashProvider>(Get.context!, listen: false)
          .configModel!
          .walletStatus!)
        MainScreenModel(const WalletScreen(), 'wallet', Images.walletSolid),
    ],
  ),
  MenuScreensSection(
    title: 'Operations',
    screens: [
      MainScreenModel(const AddressListScreen(canPop: false), 'my_address',
          Images.homeAddressSolid),
      MainScreenModel(const CartScreen(canPop: false), 'track_order',
          Images.orderTrackSolid),
      MainScreenModel(
          const CouponScreen(canPop: false), 'coupon', Images.couponSolid),
      MainScreenModel(
          const LoyaltyScreen(), 'loyalty_point', Images.loyalityPointsSolid),
      MainScreenModel(
          const ReferAndEarnScreen(), 'referAndEarn', Images.referAndEarnSolid),
    ],
  ),
  MenuScreensSection(
    title: 'Help & Support',
    screens: [
      MainScreenModel(const SupportScreen(), 'live_chat', Images.supportSolid),
      MainScreenModel(
          const HtmlViewerScreen(
              htmlType: HtmlType.termsAndCondition, canPop: false),
          'terms_and_condition',
          Images.termsConditionSolid),
      MainScreenModel(
          const HtmlViewerScreen(
              htmlType: HtmlType.privacyPolicy, canPop: false),
          'privacy_policy',
          Images.confidentiallySolid),
      MainScreenModel(
          const HtmlViewerScreen(htmlType: HtmlType.aboutUs, canPop: false),
          'about_us',
          Images.infoSolid),
      MainScreenModel(
          const HtmlViewerScreen(htmlType: HtmlType.faq, canPop: false),
          'faq',
          Images.notificationOnSolid),
    ],
  ),
  MenuScreensSection(
    title: 'App Preference',
    screens: [
      MainScreenModel(
          const SettingsScreen(canPop: false), 'settings', Images.settings),
    ],
  ),
];

// List<MainScreenModel> screenList = [
//   MainScreenModel(const HomeScreen(), 'home', Images.home),
//   MainScreenModel(const AllCategoriesScreen(), 'all_categories', Images.list),
//   MainScreenModel(const CartScreen(), 'shopping_bag', Images.orderBag),
//   MainScreenModel(const WishListScreen(), 'favourite', Images.favouriteIcon),
//   MainScreenModel(const OrderListScreen(), 'my_order', Images.orderList),
//   MainScreenModel(
//       const OrderSearchScreen(), 'track_order', Images.orderDetails),
//   MainScreenModel(const AddressListScreen(), 'address', Images.location),
//   MainScreenModel(const CouponScreen(), 'coupon', Images.coupon),
//   MainScreenModel(
//       const ChatScreen(
//         orderModel: null,
//       ),
//       'live_chat',
//       Images.chat),
//   MainScreenModel(const SettingsScreen(), 'settings', Images.settings),
//   if (Provider.of<SplashProvider>(Get.context!, listen: false)
//       .configModel!
//       .walletStatus!)
//     MainScreenModel(const WalletScreen(), 'wallet', Images.wallet),
//   if (Provider.of<SplashProvider>(Get.context!, listen: false)
//       .configModel!
//       .loyaltyPointStatus!)
//     MainScreenModel(const LoyaltyScreen(), 'loyalty_point', Images.loyaltyIcon),
//   MainScreenModel(const HtmlViewerScreen(htmlType: HtmlType.termsAndCondition),
//       'terms_and_condition', Images.termsAndConditions),
//   MainScreenModel(const HtmlViewerScreen(htmlType: HtmlType.privacyPolicy),
//       'privacy_policy', Images.privacyPolicy),
//   MainScreenModel(const HtmlViewerScreen(htmlType: HtmlType.aboutUs),
//       'about_us', Images.aboutUs),
//   if (Provider.of<SplashProvider>(Get.context!, listen: false)
//       .configModel!
//       .returnPolicyStatus!)
//     MainScreenModel(const HtmlViewerScreen(htmlType: HtmlType.returnPolicy),
//         'return_policy', Images.returnPolicy),
//   if (Provider.of<SplashProvider>(Get.context!, listen: false)
//       .configModel!
//       .refundPolicyStatus!)
//     MainScreenModel(const HtmlViewerScreen(htmlType: HtmlType.refundPolicy),
//         'refund_policy', Images.refundPolicy),
//   if (Provider.of<SplashProvider>(Get.context!, listen: false)
//       .configModel!
//       .cancellationPolicyStatus!)
//     MainScreenModel(
//         const HtmlViewerScreen(htmlType: HtmlType.cancellationPolicy),
//         'cancellation_policy',
//         Images.cancellationPolicy),
//   MainScreenModel(
//       const HtmlViewerScreen(htmlType: HtmlType.faq), 'faq', Images.faq),
// ];

class MainScreen extends StatefulWidget {
  final bool isReload;
  final CustomDrawerController drawerController;
  const MainScreen(
      {Key? key, required this.drawerController, this.isReload = true})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool canExit = kIsWeb;
  @override
  void initState() {
    if (widget.isReload) {
      HomeScreen.loadData(true, Get.context!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme =
        Provider.of<ThemeProvider>(context, listen: false).darkTheme;
    return Consumer<SplashProvider>(
      builder: (context, splash, child) {
        return CustomPopScopeWidget(
          child: Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
            final referMenu = MainScreenModel(const ReferAndEarnScreen(),
                'referAndEarn', Images.referralIcon);
            // if ((splash.configModel?.referEarnStatus ?? false) &&
            //     profileProvider.userInfoModel?.referCode != null &&
            //     screenList[9].title != 'referAndEarn') {
            //   screenList.removeWhere((menu) => menu.screen == referMenu.screen);
            //   screenList.insert(9, referMenu);
            // }

            return Consumer<LocationProvider>(
              builder: (context, locationProvider, child) => InkWell(
                onTap: () {
                  // if (!ResponsiveHelper.isDesktop(context) &&
                  //     widget.drawerController.isOpen()) {
                  //   widget.drawerController.toggle();
                  // }
                },
                child: Scaffold(
                  key: drawerKey,
                  drawer: Drawer(
                    child: MenuWidget(
                      scaffoldKey: drawerKey,
                    ),
                  ),
                  floatingActionButton: !ResponsiveHelper.isDesktop(context)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: ThirdPartyChatWidget(
                            configModel: splash.configModel!,
                          ),
                        )
                      : null,
                  appBar: ResponsiveHelper.isDesktop(context)
                      ? null
                      : AppBar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          leadingWidth: 100,
                          leading: Row(
                            children: [
                              IconButton(
                                  icon: Image.asset(Images.moreIcon,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      height: 30,
                                      width: 30),
                                  onPressed: () {
                                    drawerKey.currentState!.openDrawer();
                                    // widget.drawerController.toggle();
                                  }),
                              IconButton(
                                icon: Image.asset(
                                  Images.search,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  width: 30,
                                  height: 30,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteHelper.searchProduct);
                                },
                              ),
                            ],
                          ),
                          centerTitle: true,
                          title: splash.pageIndex == 0
                              ? Image.asset(
                                  Images.appLogo,
                                  height: 200,
                                )
                              // Row(children: [
                              //     Image.asset(Images.appLogo, width: 25),
                              //     const SizedBox(
                              //         width: Dimensions.paddingSizeSmall),
                              //     Expanded(
                              //         child: Text(
                              //       AppConstants.appName,
                              //       maxLines: 1,
                              //       textAlign: TextAlign.center,
                              //       overflow: TextOverflow.ellipsis,
                              //       style: poppinsMedium.copyWith(
                              //           color: Theme.of(context)
                              //               .colorScheme
                              //               .onPrimary),
                              //     )),
                              //   ])
                              : Text(
                                  getTranslated(
                                      menuSections[splash.screenCategoryIndex]
                                          .screens[splash.pageIndex]
                                          .title,
                                      context),
                                  style: poppinsMedium.copyWith(
                                      fontSize: Dimensions.fontSizeLarge,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                          actions: splash.pageIndex == 0
                              ? [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteHelper.notification);
                                    },
                                    child: Icon(Icons.notifications,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        size: 30),
                                  ),
                                  IconButton(
                                      icon: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Icon(Icons.shopping_cart,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary
                                                    .withOpacity(
                                                        isDarkTheme ? 0.9 : 1),
                                                size: 30),
                                            Positioned(
                                              top: -7,
                                              right: -2,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .error),
                                                child: Text(
                                                    '${Provider.of<CartProvider>(context).cartList.length}',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .cardColor,
                                                        fontSize: 10)),
                                              ),
                                            ),
                                          ]),
                                      onPressed: () {
                                        splash.setPageIndex(2);
                                      }),
                                ]
                              : splash.pageIndex == 99
                                  ? [
                                      Center(child: Consumer<CartProvider>(
                                          builder: (context, cartProvider, _) {
                                        return Text(
                                            '${cartProvider.cartList.length} ${getTranslated('items', context)}',
                                            style: poppinsMedium.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary));
                                      })),
                                      const SizedBox(width: 20)
                                    ]
                                  : null,
                        ),
                  body: menuSections[splash.screenCategoryIndex]
                      .screens[splash.pageIndex]
                      .screen,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
