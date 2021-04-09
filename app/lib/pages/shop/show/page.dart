// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/routes.dart';
// import 'package:schooluniform/configs/collections.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';
import 'package:schooluniform/pages/shop/buy/uniform/step1.dart';
import 'package:schooluniform/pages/user/cart/page.dart';

class ShopUniformShowArg {
  ShopUniformShowArg({
    this.data,
  });

  final dynamic data;
}

class ShopShowPage extends StatefulWidget {
  @override
  ShopShowPageState createState() => ShopShowPageState();
}

class ShopShowPageState extends State<ShopShowPage> {
  int thumbnailPage = 0;
  PageController thumbnailController = PageController(initialPage: 0);

  void addToCart() async {
    // User u = FirebaseAuth.instance.currentUser;

    ShopUniformShowArg data = ModalRoute.of(context).settings.arguments;

    var payload = {
      "id": data.data["code"],
      "thumbnail": data.data["images"][0],
      "title": data.data["uniforms"].length - 1 == 0
          ? "${data.data["filter-school"]} · ${data.data["filter-gender"]} · ${data.data["filter-clothType"][0]}"
          : "${data.data["filter-school"]} · ${data.data["filter-gender"]} · ${data.data["filter-clothType"][0]} 외 ${data.data["uniforms"].length - 1}",
    };

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
                      "장바구니에 추가되었습니다\n장바구니로 이동하시겠습니까?",
                      style: GoogleFonts.notoSans(
                          fontSize: 14, color: Color(0xff444444), height: 1.57),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(Routes.userCartUrl);
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 40,
                          alignment: Alignment.center,
                          height: 52,
                          decoration: BoxDecoration(
                            color: grey3,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            "장바구니로 이동",
                            style: GoogleFonts.notoSans(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 40,
                          alignment: Alignment.center,
                          height: 52,
                          decoration: BoxDecoration(
                            gradient: gradSig,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            "계속 둘러보기",
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

    // var doc = await getUniformCarts(u.uid).get();

    // if (doc.exists) {
    //   var d = doc.data();
    //   if (d["index"].indexOf(data.data["code"]) == -1) {
    //     await Future.wait([
    //       getUniformCarts(u.uid).update({
    //         "index": FieldValue.arrayUnion([data.data["code"]]),
    //         data.data["code"]: payload,
    //       }),
    //       collectionUsers.doc(u.uid).update({
    //         "totalAlarms": FieldValue.increment(1),
    //         "totalAlarmsCart": FieldValue.increment(1),
    //       }),
    //     ]);
    //     infoStore.updateUserData(
    //         "totalAlarms", infoStore.userInfo["totalAlarms"] + 1);
    //     infoStore.updateUserData(
    //         "totalAlarmsCart", infoStore.userInfo["totalAlarmsCart"] + 1);
    //   }
    // } else {
    //   await Future.wait([
    //     getUniformCarts(u.uid).set({
    //       "index": [data.data["code"]],
    //       data.data["code"]: payload,
    //     }),
    //     collectionUsers.doc(u.uid).update({
    //       "totalAlarms": FieldValue.increment(1),
    //       "totalAlarmsCart": FieldValue.increment(1),
    //     }),
    //   ]);
    //   infoStore.updateUserData(
    //       "totalAlarms", infoStore.userInfo["totalAlarms"] + 1);
    //   infoStore.updateUserData(
    //       "totalAlarmsCart", infoStore.userInfo["totalAlarmsCart"] + 1);
    // }
  }

  void buyNow() async {
    ShopUniformShowArg data = ModalRoute.of(context).settings.arguments;

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
                          Navigator.of(context).pushNamed(Routes.shopStep1Url,
                              arguments: data.data["code"]);
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

  @override
  Widget build(BuildContext context) {
    ShopUniformShowArg data = ModalRoute.of(context).settings.arguments;

    List clothes = [];

    if (data.data["filter-clothType"].indexOf("자켓") != -1)
      clothes.add("jacket");
    if (data.data["filter-clothType"].indexOf("셔츠") != -1)
      clothes.add("shirts-long");
    if (data.data["filter-clothType"].indexOf("상의") != -1)
      clothes
          .add(data.data["filter-season"] == "체육복" ? "jersey" : "shirts-short");
    if (data.data["filter-clothType"].indexOf("바지") != -1) clothes.add("pants");
    if (data.data["filter-clothType"].indexOf("하의") != -1) clothes.add("pants");
    if (data.data["filter-clothType"].indexOf("치마") != -1)
      clothes.add("skirts");
    if (data.data["filter-clothType"].indexOf("넥타이") != -1)
      clothes.add("necktie");
    if (data.data["filter-clothType"].indexOf("조끼") != -1) clothes.add("vest");

    return Scaffold(
        body: Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  child: PageView(
                    controller: thumbnailController,
                    onPageChanged: (value) {
                      setState(() {
                        thumbnailPage = value;
                      });
                    },
                    children: [
                      for (var img in data.data["images"])
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: NetworkImage(img))),
                        )
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        color: Color(0x80000000),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Text(
                        "${thumbnailPage + 1} / ${data.data["images"].length}",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.white,
                        )),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  brightness: Brightness.dark,
                  elevation: 0,
                  leading: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Image(
                        image: AssetImage("assets/icon/show-backbutton.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 12, left: 16, right: 16),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Text(
                      "상품코드",
                      style: GoogleFonts.notoSans(
                          fontSize: 16, color: Color(0xff444444)),
                    ),
                  ),
                  Text(
                    data.data["code"],
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Color(0xff888888)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  for (var c in clothes)
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: grey2,
                      ),
                      child: Image(
                        image: AssetImage("assets/icon/$c-grey.png"),
                      ),
                    )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 32, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      child: Text(
                        "상품정보",
                        style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: Color(0xff444444),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                          "${data.data["uniforms"][0]["school"]} / ${data.data["uniforms"][0]["gender"]} / ${data.data["uniforms"][0]["season"]}"),
                    ),
                    for (var uniform in data.data["uniforms"])
                      Container(
                        child: Text(
                            "- ${uniform["clothType"]}: ${uniform["size"]}"),
                      ),
                  ],
                )),
          ],
        ),
        Positioned(
            bottom: 0,
            child: data.data["status"] == "교복보유중"
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).padding.bottom + 52,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: addToCart,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff666666),
                                        Color(0xff444444)
                                      ]),
                                ),
                                padding: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(context).padding.bottom),
                                alignment: Alignment.center,
                                child: Text(
                                  "장바구니",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: buyNow,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: gradSig,
                                ),
                                padding: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(context).padding.bottom),
                                alignment: Alignment.center,
                                child: Text(
                                  "구매하기 (무료)",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                : Container(
                    color: grey3,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).padding.bottom + 52,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom),
                    child: Text(
                      "다른 유저가 이미 신청한 상품입니다",
                      style: GoogleFonts.notoSans(
                          fontSize: 14, color: Color(0xff444444)),
                    ),
                  )),
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x51000000), Color(0x00000000)])),
          ),
        ),
      ],
    ));
  }
}
