// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:math';
// import 'dart:io';

import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/components/loading.dart';
import 'package:schooluniform/configs/routes.dart';
// import 'package:schooluniform/configs/collections.dart';
import 'package:schooluniform/constants/theme.dart';
import 'package:schooluniform/pages/donate/uniform/step1.dart';
import 'package:schooluniform/pages/donate/uniform/types/donateInfo.dart';
import 'package:schooluniform/pages/home/page.dart';
import 'package:schooluniform/pages/policy/page.dart';
import 'package:schooluniform/pages/user/donate/uniform/page.dart';

class DonateStep5 extends StatefulWidget {
  static String url = "/donate/uniform/5";

  @override
  DonateStep5State createState() => DonateStep5State();
}

class DonateStep5State extends State<DonateStep5> {
  bool loading = false;

  String name;
  String phone;
  String address;
  String office;
  bool checkPolicy = false;

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

  String getId() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyMMdd-HHmm-ss');
    final String formatted = formatter.format(now);
    var rng = new Random();
    int postfix = rng.nextInt(100);
    return '$formatted${postfix < 10 ? '0' : ''}$postfix';
  }

  handleUpload() async {
    setState(() {
      loading = true;
    });

    // User user = FirebaseAuth.instance.currentUser;
    // String uid = user.uid;

    DonateInfo d = ModalRoute.of(context).settings.arguments;
    String id = getId();

    // FirebaseStorage storage = FirebaseStorage.instance;
    // Reference ref = storage.ref("daegu/bukgu/$id");

    // int i = 1;
    List<Future<dynamic>> futureImgUpload = [];
    List<Future<dynamic>> futureImgUrlDownload = [];

    d.images.forEach((image) async {
      // futureImgUpload.add(ref.child('$i.png').putFile(File(image.path)));
      // i += 1;
    });

    await Future.wait(futureImgUpload);

    // i = 1;
    d.images.forEach((image) {
      // futureImgUrlDownload
      //     .add(storage.ref("daegu/bukgu/$id/$i.png").getDownloadURL());
      // i += 1;
    });

    var images;
    images = await Future.wait(futureImgUrlDownload);

    var uniformValue = {
      "totalImages": d.images.length,
      "images": images,
      "status": "기부승인요청",
      "code": id,
      "giverName": name,
      // "giverUid": uid,
      "giverPhone": phone,
      "giverAddress": address,
      "giverDeliveryType": d.deliveryType,
      "uniforms": d.uniforms.map((v) => v.toJSON()).toList(),
      "filter-school": d.school,
      "filter-gender": d.gender,
      "filter-season": d.season,
    };

    List filterClothType = [];

    d.uniforms.forEach((u) {
      filterClothType.add(u.clothType);
    });

    uniformValue["filter-clothType"] = filterClothType;

    // var commonUpdateInfo = {
    // "totalDonate": FieldValue.increment(1),
    // "totalBeforeStock": FieldValue.increment(1),
    // "${d.school.indexOf("고등") == -1 ? "middleSchool" : "highSchool"}.${d.school}.totalDonate":
    //     FieldValue.increment(1),
    // };

    // var log = {
    //   "title": d.uniforms.length - 1 == 0
    //       ? "${d.school} · ${d.gender} · ${d.uniforms[0].clothType}"
    //       : "${d.school} · ${d.gender} · ${d.uniforms[0].clothType} 외 ${d.uniforms.length - 1}",
    //   "uniformId": id,
    //   "status": "기부승인요청",
    //   "showStatus": d.deliveryType == "수거 요청" ? "수거요청" : "방문필요",
    //   "thumbnail": images[0],
    // };

    // var doc = await getLogsUniformDonate(uid).get();

    List<Future<dynamic>> futures = [
      // collectionUniforms.doc(id).set(uniformValue),
      // common.update(commonUpdateInfo),
      // doc.exists
      //     ? getLogsUniformDonate(uid).update({
      //         "index": FieldValue.arrayUnion([id]),
      //         id: log,
      //       })
      //     : getLogsUniformDonate(uid).set({
      //         "index": [id],
      //         id: log,
      //       }),
    ];

    try {
      await Future.wait(futures);
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.userDonateUniformUrl,
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
                        "교복은 센터 확인 후\n앱에 등록되어 다른유저에게 공개됩니다",
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
    DonateInfo d = ModalRoute.of(context).settings.arguments;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: Text("교복 기부하기",
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
                  "기부자 정보를 입력해주세요",
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
                    onChanged: (text) {
                      setState(() {
                        name = text;
                      });
                    },
                    cursorColor: colorSig1,
                    keyboardType: TextInputType.text,
                    decoration: deco("기부자 이름을 적어주세요"),
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
              d.deliveryType == "수거 요청"
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
                              decoration: deco("수거할 주소를 입력해주세요"),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              d.deliveryType == "복지센터 방문"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "동 행정복지센터",
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
                              decoration: deco("방문할 동 행정복지센터를 입력해주세요 ex.태전1동"),
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
                      (d.deliveryType == "수거 요청" &&
                          (address == null || address.length == 0)) ||
                      (d.deliveryType == "복지센터 방문" &&
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
                            "기부하기",
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
                            "기부하기",
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
