import 'package:get/get.dart';

import 'package:schooluniform/pages/donate/thing/parking.dart';
import 'package:schooluniform/pages/donate/uniform/step1-1.dart';
import 'package:schooluniform/pages/donate/uniform/step1-2.dart';
import 'package:schooluniform/pages/donate/uniform/step1-3.dart';
import 'package:schooluniform/pages/donate/uniform/step1-4.dart';
import 'package:schooluniform/pages/donate/uniform/step1.dart';
import 'package:schooluniform/pages/donate/uniform/step3.dart';
import 'package:schooluniform/pages/donate/uniform/step4.dart';
import 'package:schooluniform/pages/donate/uniform/step5.dart';
import 'package:schooluniform/pages/home/homePage.dart';
import 'package:schooluniform/pages/init/initPage.dart';
import 'package:schooluniform/pages/policy/page.dart';
import 'package:schooluniform/pages/ranking/school/page.dart';
import 'package:schooluniform/pages/shop/filter/page.dart';
import 'package:schooluniform/pages/shop/list/page.dart';
import 'package:schooluniform/pages/shop/order/uniform/step1.dart';
import 'package:schooluniform/pages/shop/order/uniform/step2.dart';
import 'package:schooluniform/pages/shop/order/uniform/step3.dart';
import 'package:schooluniform/pages/shop/show/page.dart';
import 'package:schooluniform/pages/shop/show/pageDirect.dart';
import 'package:schooluniform/pages/support/page.dart';
import 'package:schooluniform/pages/user/cart/page.dart';
import 'package:schooluniform/pages/user/donate/uniform/page.dart';
import 'package:schooluniform/pages/user/purchase/uniform/page.dart';
import 'package:schooluniform/pages/user/purchase/uniform/reject/reject.dart';
import 'package:schooluniform/pages/user/support/page.dart';
import 'package:schooluniform/widgets/pages/shop/list/filterCloth.dart';
import 'package:schooluniform/widgets/pages/shop/list/filterGender.dart';

class Routes {
  static const String initUrl = "/init";
  static const String homeUrl = "/home";
  static const String donateThingParkingUrl = "/donate/thing/parking";
  static const String donateStep1Url = "/donate/uniform/1";
  static const String donateStep2Url = "/donate/uniform/2";
  static const String donateStep3Url = "/donate/uniform/3";
  static const String donateStep4Url = "/donate/uniform/4";
  static const String donateStep5Url = "/donate/uniform/5";
  static const String donateStep1_1Url = "/donate/uniform/1-1";
  static const String donateStep1_2Url = "/donate/uniform/1-2";
  static const String donateStep1_3Url = "/donate/uniform/1-3";
  static const String donateStep1_4Url = "/donate/uniform/1-4";
  static const String shopFilterUrl = "/shop/filter";
  static const String shopListUrl = "/shop/list";
  static const String shopListGenderFilterUrl =
      "/shop/uniform/list/filter/gender";
  static const String shopListClothFilterUrl =
      "/shop/uniform/list/filter/cloth";
  static const String shopShowUrl = "/shop/show";
  static const String shopShowDirectUrl = "/shop/show/direct";
  static const String shopStep1Url = "/shop/uniform/1";
  static const String shopStep2Url = "/shop/uniform/2";
  static const String shopStep3Url = "/shop/uniform/3";
  static const String supportUrl = "/support";
  static const String userCartUrl = "/user/cart";
  static const String userDonateUniformUrl = "/user/uniform/donate";
  static const String userPurchaseUniformUrl = "/user/uniform/purchase";
  static const String userPurchaseUniformRejectUrl =
      "/user/uniform/purchase/reject";
  static const String userSupportUrl = "/user/support";
  static const String policyUrl = "/policy";
  static const String rankingSchoolUrl = "/ranking/school";

  static final pages = [
    GetPage(
      name: Routes.initUrl,
      page: () => InitPage(),
    ),
    GetPage(
      name: Routes.homeUrl,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.donateThingParkingUrl,
      page: () => DonateThingParking(),
    ),
    GetPage(name: Routes.donateStep1Url, page: () => DonateStep1()),
    // GetPage(name: Routes.donateStep2Url),
    GetPage(
      name: Routes.donateStep3Url,
      page: () => DonateStep3(),
    ),
    GetPage(
      name: Routes.donateStep4Url,
      page: () => DonateStep4(),
    ),
    GetPage(
      name: Routes.donateStep5Url,
      page: () => DonateStep5(),
    ),
    GetPage(
      name: Routes.donateStep1_1Url,
      page: () => DonateStep1_1(),
    ),
    GetPage(
      name: Routes.donateStep1_2Url,
      page: () => DonateStep1_2(),
    ),
    GetPage(
      name: Routes.donateStep1_3Url,
      page: () => DonateStep1_3(),
    ),
    GetPage(
      name: Routes.donateStep1_4Url,
      page: () => DonateStep1_4(),
    ),
    GetPage(
      name: Routes.shopFilterUrl,
      page: () => ShopFilterPage(),
    ),
    GetPage(
      name: Routes.shopListUrl,
      page: () => ShopListPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.shopListGenderFilterUrl,
      page: () => ShopListGenderFilter(),
    ),
    GetPage(
      name: Routes.shopListClothFilterUrl,
      page: () => ShopListClothFilter(),
    ),
    GetPage(
      name: Routes.shopShowUrl,
      page: () => ShopShowPage(),
    ),
    GetPage(
      name: Routes.shopShowDirectUrl,
      page: () => ShopShowDirectPage(),
    ),
    GetPage(
      name: Routes.shopStep1Url,
      page: () => OrderStep1(),
    ),
    GetPage(
      name: Routes.shopStep2Url,
      page: () => OrderStep2(),
    ),
    GetPage(
      name: Routes.shopStep3Url,
      page: () => OrderStep3(),
    ),
    GetPage(
      name: Routes.supportUrl,
      page: () => SupportPage(),
    ),
    GetPage(
      name: Routes.userCartUrl,
      page: () => UserCartPage(),
    ),
    GetPage(
      name: Routes.userDonateUniformUrl,
      page: () => UserDonateUniformPage(),
    ),
    GetPage(
      name: Routes.userPurchaseUniformUrl,
      page: () => UserPurchaseUniformPage(),
    ),
    GetPage(
      name: Routes.userPurchaseUniformRejectUrl,
      page: () => UserPurchaseUniformRejectPage(),
    ),
    GetPage(
      name: Routes.userSupportUrl,
      page: () => UserSupportPage(),
    ),
    GetPage(
      name: Routes.policyUrl,
      page: () => PolicyPage(),
    ),
    GetPage(
      name: Routes.rankingSchoolUrl,
      page: () => RankingSchoolPage(),
    ),
  ];
}
