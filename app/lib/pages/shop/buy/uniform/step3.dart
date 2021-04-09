// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/components/loading.dart';
import 'package:schooluniform/configs/routes.dart';
// import 'package:schooluniform/configs/collections.dart';
import 'package:schooluniform/constants/theme.dart';
import 'package:schooluniform/pages/home/page.dart';
import 'package:schooluniform/pages/policy/page.dart';
import 'package:schooluniform/pages/user/purchase/uniform/page.dart';

class ShopUniformInputData {
  ShopUniformInputData(
      {this.code,
      this.deliveryType,
      this.certFront,
      this.certBack,
      this.certName,
      this.certBirth,
      this.certSchool});

  final String code;
  final String deliveryType;
  final PickedFile certFront;
  final PickedFile certBack;
  final String certName;
  final String certBirth;
  final String certSchool;
}

class ShopStep3 extends StatefulWidget {
  @override
  ShopStep3State createState() => ShopStep3State();
}

class ShopStep3State extends State<ShopStep3> {
  bool loading = false;

  String name;
  TextEditingController nameController = TextEditingController();
  String phone;
  String address;
  bool checkPolicy = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      ShopUniformInputData d = ModalRoute.of(context).settings.arguments;
      setState(() {
        print(d.certName);
        nameController.text = d.certName;
        name = d.certName;
      });
    });
  }

  InputDecoration deco(String hintText) {
    return InputDecoration(
      counterStyle: TextStyle(
        height: double.minPositive,
      ),
      counterText: "",
      enabledBorder: InputBorder.none,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      isDense: true,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.all(0),
      hintText: hintText,
      hintStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffb7b7b7)),
    );
  }

  togglePolicy() {
    setState(() {
      checkPolicy = !checkPolicy;
    });
  }

  handleUpload() async {
    try {
      setState(() {
        loading = true;
      });
      ShopUniformInputData d = ModalRoute.of(context).settings.arguments;
      // User user = FirebaseAuth.instance.currentUser;
      // String uid = user.uid;

      // FirebaseStorage storage = FirebaseStorage.instance;

      // bool hasCertImage = d.certFront != null && d.certBack != null;

      // if (hasCertImage) {
      //   Reference ref = storage.ref("daegu/bukgu/${d.code}");

      //   await Future.wait([
      //     ref.child('certFront.png').putFile(File(d.certFront.path)),
      //     ref.child('certBack.png').putFile(File(d.certBack.path)),
      //   ]);
      // }

      // List<Future<dynamic>> futures = hasCertImage
      //     ? [
      //         collectionUniforms.doc(d.code).get(),
      //         getLogsUniformShop(uid).get(),
      //         storage
      //             .ref("daegu/bukgu/${d.code}/certFront.png")
      //             .getDownloadURL(),
      //         storage
      //             .ref("daegu/bukgu/${d.code}/certBack.png")
      //             .getDownloadURL(),
      //       ]
      //     : [
      //         collectionUniforms.doc(d.code).get(),
      //         getLogsUniformShop(uid).get(),
      //       ];

      // var res = await Future.wait(futures);

      // var data = res[0].data();

      // var commonUpdateInfo = {
      //   "totalStock": FieldValue.increment(-1),
      //   "totalBeforeShop": FieldValue.increment(1),
      //   "${data["filter-school"].indexOf("고등") == -1 ? "middleSchool" : "highSchool"}.${data["filter-school"]}.totalStock":
      //       FieldValue.increment(-1),
      // };

      // var log = {
      //   "title": data["uniforms"].length - 1 == 0
      //       ? "${data["filter-school"]} · ${data["filter-gender"]} · ${data["uniforms"][0]["clothType"]}"
      //       : "${data["filter-school"]} · ${data["filter-gender"]} · ${data["uniforms"][0]["clothType"]} 외 ${data["uniforms"].length - 1}",
      //   "uniformId": d.code,
      //   "status": "구매승인요청",
      //   "showStatus": "구매승인요청",
      //   "thumbnail": data["images"][0],
      // };

      // final DateTime now = DateTime.now();
      // final DateFormat formatter = DateFormat('yyyy. MM. dd HH:mm:ss');
      // final String formatted = formatter.format(now);

      List<Future<dynamic>> futures2 = [
        // collectionUniforms.doc(d.code).update({
        //   "receiverUid": uid,
        //   "receiverName": name,
        //   "receiverPhone": phone,
        //   "receiverAddress": address,
        //   "receiverDeliveryType": d.deliveryType,
        //   "receiverCert": hasCertImage ? [res[2], res[3]] : [],
        //   "receiverBirth": d.certBirth,
        //   "receiverSchool": d.certSchool,
        //   "status": "구매승인요청",
        //   "dateShop": formatted,
        // }),
        // common.update(commonUpdateInfo),
        // res[1].exists
        //     ? getLogsUniformShop(uid).update({
        //         "index": FieldValue.arrayUnion([d.code]),
        //         d.code: log,
        //       })
        //     : getLogsUniformShop(uid).set({
        //         "index": [d.code],
        //         d.code: log,
        //       }),
      ];

      await Future.wait(futures2);
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.userPurchaseUniformUrl,
          (route) => route.settings.name == Routes.homeUrl);
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
              padding:
                  EdgeInsets.only(top: 36, bottom: 24, left: 16, right: 16),
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
                        "센터에서 확인 후, 승인이 되면\n푸쉬 알림으로 알려드립니다",
                        style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: Color(0xff444444),
                            height: 1.57),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 64,
                            alignment: Alignment.center,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: gradSig,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Text(
                              "확인",
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
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    ShopUniformInputData d = ModalRoute.of(context).settings.arguments;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: Text("구매하기 / 구매자정보",
                style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black)),
            popButton: true,
            border: true,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 42),
                child: Text(
                  "구매자 정보를 입력해주세요",
                  style: GoogleFonts.notoSans(
                      fontSize: 24, fontWeight: FontWeight.w300, height: 1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  "이름",
                  style: GoogleFonts.notoSans(fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration:
                      BoxDecoration(border: Border.all(width: 1, color: grey3)),
                  child: TextField(
                    controller: nameController,
                    onChanged: (text) {
                      setState(() {
                        name = text;
                      });
                    },
                    cursorColor: colorSig1,
                    keyboardType: TextInputType.text,
                    decoration: deco("구매자 이름을 적어주세요"),
                    maxLength: 10,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  "전화번호",
                  style: GoogleFonts.notoSans(fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration:
                      BoxDecoration(border: Border.all(width: 1, color: grey3)),
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        phone = text;
                      });
                    },
                    cursorColor: colorSig1,
                    keyboardType: TextInputType.phone,
                    decoration: deco("- 생략"),
                    maxLength: 11,
                  ),
                ),
              ),
              d.deliveryType == "배송 요청"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "주소",
                            style: GoogleFonts.notoSans(fontSize: 12),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 24),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: grey3)),
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  address = text;
                                });
                              },
                              cursorColor: colorSig1,
                              keyboardType: TextInputType.streetAddress,
                              decoration: deco("배송을 요청할 주소를 입력해주세요"),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: togglePolicy,
                      child: Container(
                        color: Colors.transparent,
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(checkPolicy
                                        ? "assets/icon/checkbox-active.png"
                                        : "assets/icon/checkbox-inactive.png"))),
                          ),
                          Text(
                            "개인정보수집 및 이용 동의",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          )
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(Routes.policyUrl),
                      child: Text(
                        "전문보기",
                        style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: colorSig2,
                            decoration: TextDecoration.underline,
                            height: 1,
                            decorationColor: colorSig2),
                      ),
                    )
                  ],
                ),
              ),
              (name == null || name.length == 0) ||
                      (phone == null || phone.length != 11) ||
                      (d.deliveryType == "배송 요청" &&
                          (address == null || address.length == 0)) ||
                      !checkPolicy
                  ? Container(
                      margin: EdgeInsets.only(top: 24),
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 32,
                          height: 52,
                          decoration: BoxDecoration(
                              color: grey6,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            "구매하기 (무료)",
                            style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ))
                  : Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 24),
                      child: GestureDetector(
                        onTap: handleUpload,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 32,
                          height: 52,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              gradient: gradSig,
                              boxShadow: [shadowSig]),
                          child: Text(
                            "구매하기 - 무료",
                            style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ))
            ],
          ),
        ),
        loading ? LoadingPage() : Container(),
      ],
    );
  }
}
