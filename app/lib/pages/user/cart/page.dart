import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/api/user/cart/get.dart';
import 'package:schooluniform/configs/routes.dart';

import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';

import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/components/loading.dart';
import 'package:schooluniform/pages/user/cart/widgets/buyCart.dart';
import 'package:schooluniform/pages/user/cart/widgets/card.dart';
import 'package:schooluniform/pages/user/cart/widgets/deleteCart.dart';

class UserCartPage extends StatefulWidget {
  @override
  UserCartPageState createState() => UserCartPageState();
}

class UserCartPageState extends State<UserCartPage> {
  bool loading = true;
  List list = [];
  String itemCode = "";

  void request() async {
    try {
      // User u = FirebaseAuth.instance.currentUser;

      List<Future<dynamic>> futures = [
        getUserCart(id: 1),
        //   getUniformCarts(u.uid).get(),
        //   collectionUsers.doc(u.uid).get(),
      ];

      var res = await Future.wait(futures);

      // DocumentSnapshot doc = res[0];
      // DocumentSnapshot doc1 = res[1];

      // collectionUsers.doc(u.uid).update({
      //   "totalAlarms":
      //       FieldValue.increment(-1 * doc1.data()["totalAlarmsCart"]),
      //   "totalAlarmsCart": 0,
      // });

      infoStore.updateUserData(
          "totalAlarms",
          infoStore.userInfo["totalAlarms"] -
              infoStore.userInfo["totalAlarmsCart"]);
      infoStore.updateUserData("totalAlarmsCart", 0);

      if (res[0].isEmpty == false) {
        var _data = res[0];
        List l = [];
        for (int i = _data.length - 1; i >= 0; i--) {
          print(_data[i]);
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

  handleCancel() {
    Navigator.of(context).pop();
  }

  handleDelete({
    id,
  }) async {
    setState(() {
      list = list.where((element) => element["id"] != id).toList();
    });
    Navigator.of(context).pop();
    try {
      // await getUniformCarts(u.uid).update({
      //   "index": FieldValue.arrayRemove([id]),
      //   id: FieldValue.delete(),
      // });
    } catch (err) {
      print(err);
    }
  }

  handleBuy({id}) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(Routes.shopStep1Url, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    print(itemCode);
    return Scaffold(
        backgroundColor: grey2,
        appBar: Header(
          popButton: true,
          title: Text(
            "장바구니",
            style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
          ),
          border: false,
        ),
        body: loading
            ? LoadingPage()
            : Stack(
                children: [
                  ListView(
                    children: [
                      for (var d in list)
                        card(
                            context: context,
                            data: d,
                            itemCode: itemCode,
                            onClickToItem: () => setState(() {
                                  itemCode = d["id"];
                                }),
                            onClickToDeleteWidget: () => deleteCart(
                                  context: context,
                                  id: d["id"],
                                  onClickToCancel: handleCancel,
                                  onClickToDelete: () =>
                                      handleDelete(id: d["id"]),
                                )),
                    ],
                  ),
                  itemCode == ""
                      ? Container()
                      : Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () => buy(
                                context: context,
                                onClickToCancel: handleCancel,
                                onClickToBuy: () => handleBuy(id: itemCode)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  52 + MediaQuery.of(context).padding.bottom,
                              decoration: BoxDecoration(
                                gradient: gradSig,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(context).padding.bottom),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "구매하기 (무료)",
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                ],
              ));
  }
}
