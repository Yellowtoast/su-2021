// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/components/loading.dart';
// import 'package:schooluniform/configs/collections.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';

class UserDonateUniformPage extends StatefulWidget {
  static String url = "/user/uniform/donate";

  @override
  UserDonateUniformPageState createState() => UserDonateUniformPageState();
}

class UserDonateUniformPageState extends State<UserDonateUniformPage> {
  bool loading = true;
  List list = [];

  void request() async {
    // User u = FirebaseAuth.instance.currentUser;

    List<Future<dynamic>> futures = [
      // getLogsUniformDonate(u.uid).get(),
      // collectionUsers.doc(u.uid).get(),
    ];

    var res = await Future.wait(futures);

    // DocumentSnapshot doc = res[0];
    // DocumentSnapshot doc1 = res[1];

    // collectionUsers.doc(u.uid).update({
    //   "totalAlarms":
    //       FieldValue.increment(-1 * doc1.data()["totalAlarmsDonate"]),
    //   "totalAlarmsDonate": 0,
    // });

    infoStore.updateUserData(
        "totalAlarms",
        infoStore.userInfo["totalAlarms"] -
            infoStore.userInfo["totalAlarmsDonate"]);
    infoStore.updateUserData("totalAlarmsDonate", 0);

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
  }

  void initState() {
    super.initState();
    request();
  }

  Widget card(data) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(data["thumbnail"]), fit: BoxFit.cover),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 112,
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  data["title"] ??
                      "afdadfasdfasdfasdfasdfasfdasdfasfdasfdasfdasdf",
                  style: GoogleFonts.notoSans(fontSize: 14, height: 1.57),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(data["showStatus"],
                  style:
                      GoogleFonts.notoSans(fontSize: 12, color: colorSubBlue)),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey2,
      appBar: Header(
        popButton: true,
        title: Text(
          "나의 교복기부 내역",
          style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
        ),
        border: false,
      ),
      body: loading
          ? LoadingPage()
          : ListView(
              children: [
                for (var d in list) card(d),
              ],
            ),
    );
  }
}
