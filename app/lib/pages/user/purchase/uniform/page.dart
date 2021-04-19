import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';

import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/components/loading.dart';
import 'package:schooluniform/pages/user/purchase/uniform/widgets/card.dart';

class UserPurchaseUniformPage extends StatefulWidget {
  @override
  UserPurchaseUniformPageState createState() => UserPurchaseUniformPageState();
}

class UserPurchaseUniformPageState extends State<UserPurchaseUniformPage> {
  bool loading = true;
  List list = [];

  void request() async {
    try {
      // User u = FirebaseAuth.instance.currentUser;

      // List<Future<dynamic>> futures = [
      // getLogsUniformShop(u.uid).get(),
      // collectionUsers.doc(u.uid).get(),
      // ];

      // var res = await Future.wait(futures);

      // DocumentSnapshot doc = res[0];
      // DocumentSnapshot doc1 = res[1];

      // collectionUsers.doc(u.uid).update({
      //   "totalAlarms":
      //       FieldValue.increment(-1 * doc1.data()["totalAlarmsShop"]),
      //   "totalAlarmsShop": 0,
      // });

      infoStore.updateUserData(
          "totalAlarms",
          infoStore.userInfo["totalAlarms"] -
              infoStore.userInfo["totalAlarmsShop"]);
      infoStore.updateUserData("totalAlarmsShop", 0);

      // if (doc.exists) {
      //   var data = doc.data();

      //   List l = [];
      //   for (int i = data["index"].length - 1; i >= 0; i--) {
      //     l.add(data["${data["index"][i]}"]);
      //   }

      //   setState(() {
      //     list = l;
      //     loading = false;
      //   });
      // } else {
      setState(() {
        loading = false;
      });
      // }
    } catch (err) {
      print(err);
    }
  }

  void initState() {
    super.initState();
    request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey2,
      appBar: Header(
        popButton: true,
        title: Text(
          "나의 교복구매 내역",
          style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
        ),
        border: false,
      ),
      body: loading
          ? LoadingPage()
          : ListView(
              children: [
                for (var d in list) card(context: context, data: d),
              ],
            ),
    );
  }
}
