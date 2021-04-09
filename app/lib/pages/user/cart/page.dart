// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/components/loading.dart';
import 'package:schooluniform/configs/routes.dart';
// import 'package:schooluniform/configs/collections.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';
import 'package:schooluniform/pages/shop/show/pageDirect.dart';

class UserCartPage extends StatefulWidget {
  static String url = "/user/cart";

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

  Future<void> deleteCart(id) async {
    // User u = FirebaseAuth.instance.currentUser;
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            padding: EdgeInsets.only(top: 36, bottom: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Container(
              height: 155,
              child: Column(
                children: [
                  Text(
                    "알림",
                    style: GoogleFonts.notoSans(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "정말로 삭제하시겠습니까?\n삭제 후에는 되돌릴 수 없습니다",
                      style: GoogleFonts.notoSans(
                          fontSize: 14, color: Color(0xff444444), height: 1.57),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 40,
                          alignment: Alignment.center,
                          height: 52,
                          decoration: BoxDecoration(
                            color: grey3,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            "취소",
                            style: GoogleFonts.notoSans(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            list = list
                                .where((element) => element["id"] != id)
                                .toList();
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
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 40,
                          alignment: Alignment.center,
                          height: 52,
                          decoration: BoxDecoration(
                            gradient: gradSig,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            "삭제",
                            style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  void buy(id) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            padding: EdgeInsets.only(top: 36, bottom: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Container(
              height: 155,
              child: Column(
                children: [
                  Text(
                    "주의사항",
                    style: GoogleFonts.notoSans(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "모든 신청이 수락되지는 않으며\n너무 빈번한 구매는 거절 당할 수 있습니다",
                      style: GoogleFonts.notoSans(
                          fontSize: 14, color: Color(0xff444444), height: 1.57),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 40,
                          alignment: Alignment.center,
                          height: 52,
                          decoration: BoxDecoration(
                            color: grey3,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            "취소",
                            style: GoogleFonts.notoSans(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamed(Routes.shopStep1Url, arguments: id);
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 40,
                          alignment: Alignment.center,
                          height: 52,
                          decoration: BoxDecoration(
                            gradient: gradSig,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            "확인했습니다",
                            style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget card(data) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    itemCode = data["id"];
                  }),
                  child: Container(
                    height: 46,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 18,
                          height: 18,
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: itemCode == data["id"]
                                      ? Colors.black
                                      : grey6)),
                          child: itemCode == data["id"]
                              ? Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black),
                                )
                              : Container(),
                        ),
                        Text(
                          "선택",
                          style: GoogleFonts.notoSans(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () => deleteCart(data["id"]),
                    child: Container(
                      width: 18,
                      height: 18,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: Image(
                        width: 12,
                        height: 12,
                        image: AssetImage("assets/icon/close-small.png"),
                      ),
                    ))
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(Routes.shopShowDirectUrl, arguments: data["id"]),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data["thumbnail"]),
                          fit: BoxFit.cover),
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
                          style:
                              GoogleFonts.notoSans(fontSize: 14, height: 1.57),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
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
                      for (var d in list) card(d),
                    ],
                  ),
                  itemCode == ""
                      ? Container()
                      : Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () => buy(itemCode),
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
