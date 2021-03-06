import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import "dart:async";
import "dart:core";
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:schooluniform/routes/client/client.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/utils/getMostDonateSchool.dart';
import 'package:schooluniform/utils/time/getCurrent.dart';
import 'package:schooluniform/widgets/footer/footer.dart';
import 'package:schooluniform/widgets/header/header.dart';
import 'package:schooluniform/widgets/localWidgets/homeWidgets/appbarIcon.dart';
import 'package:schooluniform/widgets/localWidgets/homeWidgets/bannerButton.dart';
import 'package:schooluniform/widgets/localWidgets/homeWidgets/countUpItem.dart';
import 'package:schooluniform/widgets/localWidgets/homeWidgets/drawerWidget.dart';
import 'package:schooluniform/widgets/localWidgets/homeWidgets/slideBanner.dart';
import 'package:schooluniform/widgets/localWidgets/homeWidgets/slideBannerItem.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  int totalBannerPage = 4;
  int bannerPage = 0;
  PageController bannerController = PageController(initialPage: 0);

  Future<void> messageHandler() async {
    RemoteMessage initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      if (initialMessage.data['confirm'] == "true") {
        Get.toNamed(Routes.userPurchaseUniformUrl);
      }
      if (initialMessage.data["confirm"] == "false") {
        Get.toNamed(Routes.userPurchaseUniformUrl);
        Get.toNamed(Routes.userPurchaseUniformRejectUrl,
            arguments: initialMessage.data["uniformId"]);
      }
    }

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                importance: Importance.max,
                priority: Priority.high,
                icon: "ic_launcher",
              ),
            ));
        Get.toNamed(Routes.userPurchaseUniformUrl);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data["confirm"] == "true") {
        Get.toNamed(Routes.userPurchaseUniformUrl);
      }
      if (message.data["confirm"] == "false") {
        Get.toNamed(Routes.userPurchaseUniformUrl);
        Get.toNamed(Routes.userPurchaseUniformRejectUrl,
            arguments: message.data["uniformId"]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    messageHandler();
    Timer.periodic(Duration(seconds: 4), (timer) {
      bannerController.animateToPage(
        (bannerPage + 1) % totalBannerPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: BGColors.grey2,
      appBar: Header(
        title: Text("?????? ?????? ?????? ??????",
            style: GoogleFonts.notoSans(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            )),
        popButton: false,
        border: false,
        actions: [
          //????????? ?????? ??? ????????? ?????? ????????? ??????
          AppbarIcon(
            onPress: () {
              _drawerKey.currentState.openEndDrawer();
            },
            drawerKey: _drawerKey,
            icon: Image(
              image: AssetImage("assets/icon/user.png"),
              width: 32,
              height: 32,
            ),
            userInfoKey: "total",
          )
        ],
      ),
      endDrawer: SideDrawer(),
      body: Observer(
        builder: (_) => ListView(
          children: [
            Container(
              height: 180,
              child: SlideBannerWidget(
                bannerController: bannerController,
                bannerPage: bannerPage,
                totalBannerPage: totalBannerPage,
                bannerItems: [
                  SwipeBannerItemWidget(
                      url: Routes.donateStep1Url,
                      imageSrc: "assets/img/banner1.png"),
                  SwipeBannerItemWidget(
                      url: Routes.shopFilterUrl,
                      imageSrc: "assets/img/banner2.png"),
                  SwipeBannerItemWidget(
                      url: Routes.supportUrl,
                      imageSrc: "assets/img/banner3.png"),
                  SwipeBannerItemWidget(
                      url: Routes.donateThingParkingUrl,
                      imageSrc: "assets/img/banner4.png"),
                ],
                onPageChanged: (value) {
                  setState(() {
                    bannerPage = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: BGColors.grey2, width: 1)),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "${getCurrentTime()} ?????? ",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: BGColors.textGrey2)),
                        TextSpan(
                            text:
                                BGinfoStore.localInfo["totalStock"].toString(),
                            style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: BGColors.textGrey2)),
                        TextSpan(
                            text: "??? ?????? ?????? ??????",
                            style: GoogleFonts.notoSans(
                                fontSize: 12, color: BGColors.textGrey2)),
                      ]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    children: [
                      CountUpItemWidget(
                        url: Routes.rankingSchoolUrl,
                        label: "?????? ?????? ?????? ??????",
                        condition: '',
                        secondaryLabel:
                            BGinfoStore.localInfo["totalDonate"].toDouble(),
                      ),
                      Container(
                        width: 1,
                        height: 52,
                        color: BGColors.grey2,
                        child: null,
                      ),
                      CountUpItemWidget(
                        url: Routes.rankingSchoolUrl,
                        label: "?????? ?????? ??????",
                        condition: getMostDonateSchool(
                            BGinfoStore.localInfo["middleSchools"],
                            BGinfoStore.localInfo["highSchools"])["school"],
                        secondaryLabel: getMostDonateSchool(
                                BGinfoStore.localInfo["middleSchools"],
                                BGinfoStore
                                    .localInfo["highSchools"])["totalDonate"]
                            .toDouble(),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: BannerButtonWidget(
                              bg: BGColors.grey2,
                              url: Routes.donateStep1Url,
                              imageSrc: "assets/img/bookie-banner-1.png",
                              label: "?????? ?????? ?????? ????????????",
                              secondaryLabel: "???????????? ?????? ????????? ????????? ???????????????"),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: BannerButtonWidget(
                              bg: Color(0xffeae1f2),
                              url: Routes.shopFilterUrl,
                              imageSrc: "assets/img/bookie-banner-0.png",
                              label: "?????? ?????? ????????????",
                              secondaryLabel: "????????? ????????? ????????? ???????????????"),
                        ),
                        Container(
                          child: BannerButtonWidget(
                              bg: Color(0xffE5DDCB),
                              url: Routes.supportUrl,
                              imageSrc: "assets/img/bookie-banner-2.png",
                              label: "???????????? ??????",
                              secondaryLabel: "????????? ???????????? ????????? ???????????????"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
