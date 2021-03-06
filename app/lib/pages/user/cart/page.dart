import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/routes/api/user.dart';
import 'package:schooluniform/routes/client/client.dart';
import 'package:schooluniform/widgets/header/header.dart';
import 'package:schooluniform/widgets/loading/loading.dart';
import 'package:schooluniform/widgets/localWidgets/userWidgets/cart/buyCart.dart';
import 'package:schooluniform/widgets/localWidgets/userWidgets/cart/card.dart';
import 'package:schooluniform/widgets/localWidgets/userWidgets/cart/deleteCart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schooluniform/routes/api/networkHandler.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';

class UserCartPage extends StatefulWidget {
  @override
  UserCartPageState createState() => UserCartPageState();
}

class UserCartPageState extends State<UserCartPage> {
  bool loading = true;
  List list = [];
  String itemCode = "";
  String logId = "";

  void request() async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('userId');
    try {
      Map userUpdateInfo = {
        "total":
            BGinfoStore.userInfo["total"] - BGinfoStore.userInfo["uniformCart"],
        "uniformCart": 0,
      };

      List<Future<dynamic>> futures = [
        NetworkHandler().get('${UserLogsApiRoutes.CART_LIST}'),
        NetworkHandler()
            .put('${UserApiRoutes.UPDATE}?targetUid=$uid', userUpdateInfo),
      ];

      var res = await Future.wait(futures);

      print(res[1]);

      BGinfoStore.updateUserData("total",
          BGinfoStore.userInfo["total"] - BGinfoStore.userInfo["uniformCart"]);
      BGinfoStore.updateUserData("uniformCart", 0);

      if (res[0] != null) {
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

  handleCancel() {
    Get.back();
  }

  handleDelete({
    id,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('userId');
    setState(() {
      list = list.where((element) => element["_id"] != id).toList();
    });
    Get.back();
    try {
      await NetworkHandler()
          .get('${UserLogsApiRoutes.CART_REMOVE}?targetUid=$uid&logId=$id');
    } catch (err) {
      print(err);
    }
  }

  handleBuy({id}) async {
    Get.back();
    Get.toNamed(Routes.shopStep1Url, arguments: id).then((_) {
      handleDelete(id: logId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BGColors.grey2,
        appBar: Header(
          popButton: true,
          title: Text(
            "????????????",
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
                                  itemCode = d["uniformId"];
                                  logId = d["_id"];
                                }),
                            onClickToDeleteWidget: () => deleteCart(
                                  context: context,
                                  id: d["_id"],
                                  onClickToCancel: handleCancel,
                                  onClickToDelete: () =>
                                      handleDelete(id: d["_id"]),
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
                              width: MediaSize.screenWidth,
                              height:
                                  52 + MediaQuery.of(context).padding.bottom,
                              decoration: BoxDecoration(
                                gradient: BGColors.gradSig,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(context).padding.bottom),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "???????????? (??????)",
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
