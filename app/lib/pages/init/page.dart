// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/routes.dart';
import 'package:schooluniform/configs/stores.dart';
// import 'package:schooluniform/constants/theme.dart';

class InitPage extends StatefulWidget {
  @override
  InitPageState createState() => InitPageState();
}

class InitPageState extends State<InitPage> {
  bool authCheck = false;

  void handleAuth() async {
    try {
      await Firebase.initializeApp();
      await infoStore.initData();
      setState(() {
        authCheck = true;
      });

      FirebaseMessaging messaging = FirebaseMessaging.instance;

      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );

      // if (infoStore.localInfo["shouldBeUpdated"]) {
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return Dialog(
      //             insetPadding: EdgeInsets.symmetric(horizontal: 16),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(8),
      //             ),
      //             elevation: 0.0,
      //             backgroundColor: Colors.transparent,
      //             child: Container(
      //               width: MediaQuery.of(context).size.width - 32,
      //               padding:
      //                   EdgeInsets.only(top: 36, bottom: 24, left: 16, right: 16),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(8),
      //                 color: Colors.white,
      //               ),
      //               child: Container(
      //                 height: 155,
      //                 child: Column(
      //                   children: [
      //                     Text(
      //                       "알림",
      //                       style: GoogleFonts.notoSans(
      //                           fontSize: 14, fontWeight: FontWeight.bold),
      //                     ),
      //                     Container(
      //                       margin: EdgeInsets.only(bottom: 12),
      //                     ),
      //                     Container(
      //                       margin: EdgeInsets.only(bottom: 24),
      //                       child: Text(
      //                         infoStore.localInfo["updateMent"],
      //                         style: GoogleFonts.notoSans(
      //                             fontSize: 14,
      //                             color: Color(0xff444444),
      //                             height: 1.57),
      //                         textAlign: TextAlign.center,
      //                       ),
      //                     ),
      //                     Row(
      //                       children: [
      //                         GestureDetector(
      //                           onTap: () => Navigator.of(context).pop(),
      //                           child: Container(
      //                             width: MediaQuery.of(context).size.width - 64,
      //                             alignment: Alignment.center,
      //                             height: 52,
      //                             decoration: BoxDecoration(
      //                               gradient: gradSig,
      //                               borderRadius:
      //                                   BorderRadius.all(Radius.circular(8)),
      //                             ),
      //                             child: Text(
      //                               "확인",
      //                               style: GoogleFonts.notoSans(
      //                                   fontSize: 16,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.white),
      //                             ),
      //                           ),
      //                         )
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ));
      //       });
      // } else {
      //   Navigator.of(context).pushReplacementNamed(Routes.homeUrl);
      // }
      Navigator.of(context).pushReplacementNamed(Routes.homeUrl);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    handleAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage("assets/img/bookie-main.png"),
                      width: 164,
                      height: 164),
                  Container(
                    margin: EdgeInsets.only(top: 12, bottom: 64),
                    child: Text(
                      "대구 북구 교복 나눔",
                      style: GoogleFonts.notoSans(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )));
  }
}
