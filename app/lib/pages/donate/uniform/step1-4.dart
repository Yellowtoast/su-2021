import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/constants/theme.dart';
import 'package:schooluniform/pages/donate/uniform/step1.dart';

class DonateState1_4InputData {
  DonateState1_4InputData({this.season, this.gender});

  final String season;
  final String gender;
}

class DonateState1_4OutputData {
  DonateState1_4OutputData({this.clothType, this.size});

  final String clothType;
  final String size;
}

class DonateStep1_4 extends StatefulWidget {
  static String url = "/donate/uniform/1-4";

  @override
  DonateStep1_4State createState() => DonateStep1_4State();
}

class DonateStep1_4State extends State<DonateStep1_4> {
  String clothType;
  String size;

  handleClothType(String g) {
    // Navigator.of(context).pop(g);
    setState(() {
      clothType = g;
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

  @override
  Widget build(BuildContext context) {
    DonateState1_4InputData data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
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
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "종류를 선택하세요",
                style: GoogleFonts.notoSans(
                    fontSize: 24, fontWeight: FontWeight.w300, height: 1),
              ),
            ),
            data.season == "동복"
                ? GestureDetector(
                    onTap: () => handleClothType("자켓"),
                    child: Container(
                      height: 46,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: clothType == "자켓"
                                        ? Colors.black
                                        : grey6)),
                            child: clothType == "자켓"
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
                            "자켓",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            data.season == "동복" || data.season == "하복"
                ? GestureDetector(
                    onTap: () => handleClothType("셔츠"),
                    child: Container(
                      height: 46,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: clothType == "셔츠"
                                        ? Colors.black
                                        : grey6)),
                            child: clothType == "셔츠"
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
                            "셔츠",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => handleClothType("상의"),
                    child: Container(
                      height: 46,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: clothType == "상의"
                                        ? Colors.black
                                        : grey6)),
                            child: clothType == "상의"
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
                            "상의",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
            data.season == "동복"
                ? GestureDetector(
                    onTap: () => handleClothType("조끼"),
                    child: Container(
                      height: 46,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: clothType == "조끼"
                                        ? Colors.black
                                        : grey6)),
                            child: clothType == "조끼"
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
                            "조끼",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ))
                : Container(),
            data.season == "동복" || data.season == "하복"
                ? GestureDetector(
                    onTap: () => handleClothType("바지"),
                    child: Container(
                      height: 46,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: clothType == "바지"
                                        ? Colors.black
                                        : grey6)),
                            child: clothType == "바지"
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
                            "바지",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => handleClothType("하의"),
                    child: Container(
                      height: 46,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: clothType == "하의"
                                        ? Colors.black
                                        : grey6)),
                            child: clothType == "하의"
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
                            "하의",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
            (data.season == "동복" || data.season == "하복") && data.gender == "여자"
                ? GestureDetector(
                    onTap: () => handleClothType("치마"),
                    child: Container(
                      height: 46,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: clothType == "치마"
                                        ? Colors.black
                                        : grey6)),
                            child: clothType == "치마"
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
                            "치마",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            data.season == "동복" || data.season == "하복"
                ? GestureDetector(
                    onTap: () => handleClothType("넥타이"),
                    child: Container(
                      height: 46,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: clothType == "넥타이"
                                        ? Colors.black
                                        : grey6)),
                            child: clothType == "넥타이"
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
                            "넥타이",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            clothType == null
                ? Container()
                : Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        border:
                            Border(top: BorderSide(color: grey2, width: 1))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "사이즈 입력",
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
                                  size = text;
                                });
                              },
                              cursorColor: colorSig1,
                              keyboardType: TextInputType.text,
                              decoration: deco("옷 사이즈를 입력해주세요"),
                              maxLength: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            clothType == null || size == null || size == ""
                ? Container()
                : Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 24),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(
                          DonateState1_4OutputData(
                              clothType: clothType, size: size)),
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: gradSig,
                            boxShadow: [shadowSig]),
                        padding: EdgeInsets.all(18),
                        child: Image(
                          image:
                              AssetImage("assets/icon/arrow-right-white.png"),
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ))
          ],
        ));
  }
}
