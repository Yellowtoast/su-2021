import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import 'package:schooluniform/routes/api/networkHandler.dart';

import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/routes/api/user.dart';

import 'package:schooluniform/widgets/header/header.dart';
import 'package:schooluniform/widgets/loading/loading.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/list/productCard.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserPurchaseUniformPage extends StatefulWidget {
  @override
  UserPurchaseUniformPageState createState() => UserPurchaseUniformPageState();
}

class UserPurchaseUniformPageState extends State<UserPurchaseUniformPage> {
  bool loading = true;
  List list = [];

  void request() async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('userId');
    try {
      Map userUpdateInfo = {
        "total":
            BGinfoStore.userInfo["total"] - BGinfoStore.userInfo["uniformShop"],
        "uniformShop": 0,
      };

      List<Future<dynamic>> futures = [
        NetworkHandler().get('${UserLogsApiRoutes.PURCHASE_LIST}'),
        NetworkHandler()
            .put('${UserApiRoutes.UPDATE}?targetUid=$uid', userUpdateInfo),
      ];

      var res = await Future.wait(futures);
      print('request res[0]');
      print(res[0]);

      print('request res[1]');
      print(res[1]);

      BGinfoStore.updateUserData("total",
          BGinfoStore.userInfo["total"] - BGinfoStore.userInfo["uniformShop"]);
      BGinfoStore.updateUserData("uniformShop", 0);

      if (res[0]['data'] != null) {
        var data = res[0]['data'];

        List l = [];
        for (int i = data.length - 1; i >= 0; i--) {
          l.add(data[i]);
        }

        print('res list data');
        print(l);

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
      backgroundColor: BGColors.grey2,
      appBar: Header(
        popButton: true,
        title: Text(
          "?????? ???????????? ??????",
          style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
        ),
        border: false,
      ),
      body: loading
          ? LoadingPage()
          : ListView(
              children: [
                for (var d in list) ProductCard(d),
              ],
            ),
    );
  }
}
