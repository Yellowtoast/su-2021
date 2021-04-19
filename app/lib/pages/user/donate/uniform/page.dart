import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/api/info/update.dart';
import 'package:schooluniform/configs/api/networkHandler.dart';
import 'package:schooluniform/configs/api/user/logs/uniform/donate/getList.dart';
import 'package:schooluniform/configs/api/user/update.dart';

import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';

import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/components/loading.dart';
import 'package:schooluniform/pages/user/donate/uniform/widgets/card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDonateUniformPage extends StatefulWidget {
  @override
  UserDonateUniformPageState createState() => UserDonateUniformPageState();
}

class UserDonateUniformPageState extends State<UserDonateUniformPage> {
  bool loading = true;
  List list = [];

  void request() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var uid = prefs.getString('userId');
      var token = prefs.getString('x-access-token');

      List<Future<dynamic>> futures = [
        getLogsUniformDonateList(token: token),
        // updateUser(token: token, data: {
        //   "targetUid": uid,
        //   "total":
        //       infoStore.userInfo["total"] - infoStore.userInfo["uniformDonate"],
        //   "uniformDonate": 0
        // })
      ];

      var res = await Future.wait(futures);

      // infoStore.updateUserData("total",
      //     infoStore.userInfo["total"] - infoStore.userInfo["uniformDonate"]);
      // infoStore.updateUserData("uniformDonate", 0);

      if (res.length > 0) {
        var _data = res[0]['data'];
        List l = [];
        for (int i = _data.length - 1; i >= 0; i--) {
          l.add(_data[i]);
        }
        setState(() {
          list = l;
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
      }
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
          "나의 교복기부 내역",
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
