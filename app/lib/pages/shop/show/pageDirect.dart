import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';
import 'package:schooluniform/routes/api/uniform.dart';
import 'package:schooluniform/routes/api/user.dart';
import 'package:schooluniform/widgets/loading/loading.dart';
import 'package:schooluniform/widgets/modal/addToCartModal.dart';
import 'package:schooluniform/widgets/modal/direct/addToCartModal.dart';
import 'package:schooluniform/widgets/modal/direct/alarmModal.dart';
import 'package:schooluniform/widgets/modal/direct/buyNowModal.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:schooluniform/routes/api/networkHandler.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/color.dart';

class ShopShowDirectPage extends StatefulWidget {
  ShopShowDirectPage({this.code});

  final String code;
  @override
  ShopShowDirectPageState createState() => ShopShowDirectPageState();
}

class ShopShowDirectPageState extends State<ShopShowDirectPage> {
  int thumbnailPage = 0;
  PageController thumbnailController = PageController(initialPage: 0);

  bool loading = true;
  var data;

  void request() async {
    print(widget.code);
    var res = await NetworkHandler()
        .get('${UniformApiRoutes.GET}?uniformId=${widget.code}');

    if (res == null) {
      Get.back();
      directAlarmModal(context: context);
    } else {
      setState(() {
        data = res['data'];
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    request();
  }

  void addToCart() async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('userId');

    directAddToCartModal(context: context);

    var res = await NetworkHandler().get('${UserLogsApiRoutes.CART_LIST}');
    print(res);

    if (res != null) {
      Map cartAddInfo = {
        "uniformId": data["code"],
      };

      Map userUpdateInfo = {
        "total": BGinfoStore.userInfo["total"] + 1,
        "uniformCart": BGinfoStore.userInfo["uniformCart"] + 1,
      };

      await Future.wait([
        NetworkHandler().put('${UserLogsApiRoutes.CART_ADD}', cartAddInfo),
        NetworkHandler()
            .put('${UserApiRoutes.UPDATE}?targetUid=$uid', userUpdateInfo),
      ]);
      BGinfoStore.updateUserData("total", BGinfoStore.userInfo["total"] + 1);
      BGinfoStore.updateUserData(
          "uniformCart", BGinfoStore.userInfo["uniformCart"] + 1);
    }
  }

  void buyNow() async {
    directBuyNowModal(context: context, data: data);
  }

  @override
  Widget build(BuildContext context) {
    List clothes = [];
    if (!loading) {
      if (data["filter-clothType"].indexOf("??????") != -1) clothes.add("jacket");
      if (data["filter-clothType"].indexOf("??????") != -1)
        clothes.add("shirts-long");
      if (data["filter-clothType"].indexOf("??????") != -1)
        clothes.add(data["filter-season"] == "?????????" ? "jersey" : "shirts-short");
      if (data["filter-clothType"].indexOf("??????") != -1) clothes.add("pants");
      if (data["filter-clothType"].indexOf("??????") != -1) clothes.add("pants");
      if (data["filter-clothType"].indexOf("??????") != -1) clothes.add("skirts");
      if (data["filter-clothType"].indexOf("?????????") != -1) clothes.add("necktie");
      if (data["filter-clothType"].indexOf("??????") != -1) clothes.add("vest");
    }

    print('data: ');
    print(data);

    return Scaffold(
        body: loading
            ? LoadingPage()
            : Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaSize.screenWidth,
                            child: PageView(
                              controller: thumbnailController,
                              onPageChanged: (value) {
                                setState(() {
                                  thumbnailPage = value;
                                });
                              },
                              children: [
                                for (var img in data["images"])
                                  Container(
                                    width: MediaSize.screenWidth,
                                    height: MediaSize.screenWidth,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkHandler()
                                                .getImage(img))),
                                  )
                              ],
                            ),
                          ),
                          Positioned(
                            right: 16,
                            bottom: 16,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                  color: Color(0x80000000),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                              child: Text(
                                  "${thumbnailPage + 1} / ${data["images"].length}",
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
                              onTap: () => Get.back(),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                child: Image(
                                  image: AssetImage(
                                      "assets/icon/show-backbutton.png"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 12, left: 16, right: 16),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Text(
                                "????????????",
                                style: GoogleFonts.notoSans(
                                    fontSize: 16, color: Color(0xff444444)),
                              ),
                            ),
                            Text(
                              data["code"],
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
                                  color: BGColors.grey2,
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
                                  "????????????",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 14,
                                      color: Color(0xff444444),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                    "${data["uniforms"][0]["school"]} / ${data["uniforms"][0]["gender"]} / ${data["uniforms"][0]["season"]}"),
                              ),
                              for (var uniform in data["uniforms"])
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
                      child: data["status"] == "???????????????"
                          ? Container(
                              width: MediaSize.screenWidth,
                              height:
                                  MediaQuery.of(context).padding.bottom + 52,
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
                                              bottom: MediaQuery.of(context)
                                                  .padding
                                                  .bottom),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "????????????",
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
                                            gradient: BGColors.gradSig,
                                          ),
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .padding
                                                  .bottom),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "???????????? (??????)",
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
                              color: BGColors.grey3,
                              width: MediaSize.screenWidth,
                              height:
                                  MediaQuery.of(context).padding.bottom + 52,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).padding.bottom),
                              child: Text(
                                "?????? ????????? ?????? ????????? ???????????????",
                                style: GoogleFonts.notoSans(
                                    fontSize: 14, color: Color(0xff444444)),
                              ),
                            )),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: MediaSize.screenWidth,
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
