import 'dart:io';
import 'dart:async';
import 'dart:math';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:schooluniform/configs/boxDeco.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/routes/api/info.dart';
import 'package:schooluniform/routes/api/uniform.dart';
import 'package:schooluniform/routes/api/user.dart';
import 'package:schooluniform/routes/client/client.dart';
import 'package:schooluniform/types/donateInfo.dart';
import 'package:schooluniform/widgets/header/header.dart';
import 'package:schooluniform/widgets/loading/loading.dart';
import 'package:schooluniform/widgets/localWidgets/donateWidgets/uniform/input.dart';
import 'package:schooluniform/widgets/modal/requestModal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schooluniform/routes/api/networkHandler.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';

class DonateStep5 extends StatefulWidget {
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

    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('userId');
    DonateInfo d = ModalRoute.of(context).settings.arguments;
    String id = getId();

    List<Future<dynamic>> imagesUpload = [];

    d.images.forEach((image) async {
      var uploadPath = NetworkHandler()
          .putImage(filePath: File(image.path).path, uniformId: id);
      imagesUpload.add(uploadPath);
    });

    var images;
    images = await Future.wait(imagesUpload);

    var uniformValue = {
      "uniformId": id,
      "totalImages": d.images.length,
      "images": images,
      "status": "기부승인요청",
      "code": id,
      "giverName": name,
      "giverUid": uid,
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
    uniformValue["title"] = d.uniforms.length - 1 == 0
        ? "${d.school} · ${d.gender} · ${d.uniforms[0].clothType}"
        : "${d.school} · ${d.gender} · ${d.uniforms[0].clothType} 외 ${d.uniforms.length - 1}";

    var schoolLevel;
    if (d.school.indexOf("고등") == -1) {
      schoolLevel = "middleSchools";
    } else {
      schoolLevel = "highSchools";
    }

    var commonUpdateInfo = {
      "totalBeforeStock": 1,
      "totalSchool": [
        schoolLevel,
        d.school,
        'totalDonate',
        1,
      ],
    };

    var log = {
      "title": d.uniforms.length - 1 == 0
          ? "${d.school} · ${d.gender} · ${d.uniforms[0].clothType}"
          : "${d.school} · ${d.gender} · ${d.uniforms[0].clothType} 외 ${d.uniforms.length - 1}",
      "uniformId": id,
      "status": "기부승인요청",
      "showStatus": d.deliveryType == "수거 요청" ? "수거요청" : "방문필요",
      "thumbnail": images[0],
    };

    List<Future<dynamic>> futures = [
      NetworkHandler().post(UniformApiRoutes.REQUEST_DONATE, uniformValue),
      NetworkHandler().post(InfoApiRoutes.UPDATE, commonUpdateInfo),
      NetworkHandler().post(UserLogsApiRoutes.DONATE_CREATE, log),
    ];

    try {
      await Future.wait(futures);
      Get.offNamedUntil(Routes.userDonateUniformUrl,
          (route) => route.settings.name == Routes.homeUrl);
      requestModal(context: context);
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
                  margin: EdgeInsets.only(bottom: 24),
                  child: InputWidget(
                    label: "이름",
                    onChanged: (text) {
                      setState(() {
                        name = text;
                      });
                    },
                    placeholder: "기부자 이름을 적어주세요",
                    maxLength: 10,
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: InputWidget(
                    label: "전화번호",
                    onChanged: (text) {
                      setState(() {
                        phone = text;
                      });
                    },
                    placeholder: "- 생략",
                    maxLength: 11,
                  )),
              d.deliveryType == "수거 요청"
                  ? Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: InputWidget(
                        label: "주소",
                        onChanged: (text) {
                          setState(() {
                            address = text;
                          });
                        },
                        placeholder: "수거할 주소를 입력해주세요",
                        maxLength: 50,
                      ))
                  : Container(),
              d.deliveryType == "복지센터 방문"
                  ? Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: InputWidget(
                        label: "동 행정복지센터",
                        onChanged: (text) {
                          setState(() {
                            address = text;
                          });
                        },
                        placeholder: "방문할 동 행정복지센터를 입력해주세요 ex.태전1동",
                        maxLength: 50,
                      ))
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
                      onTap: () => Get.toNamed(Routes.policyUrl),
                      child: Text(
                        "전문보기",
                        style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: BGColors.colorSig2,
                            decoration: TextDecoration.underline,
                            height: 1,
                            decorationColor: BGColors.colorSig2),
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
                          width: MediaSize.screenWidth - 32,
                          height: 52,
                          decoration: BoxDecoration(
                              color: BGColors.grey6,
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
                          width: MediaSize.screenWidth - 32,
                          height: 52,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              gradient: BGColors.gradSig,
                              boxShadow: [BGBoxShadow.shadowSig]),
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
