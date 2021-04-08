import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/components/header2.dart';
import 'package:schooluniform/constants/theme.dart';
import 'package:schooluniform/pages/donate/uniform/step1.dart';

class DonateStep1_3 extends StatefulWidget {
  static String url = "/donate/uniform/1-3";

  @override
  DonateStep1_3State createState() => DonateStep1_3State();
}

class DonateStep1_3State extends State<DonateStep1_3> {
  String season;

  handleSeason(String g) {
    Navigator.of(context).pop(g);
  }

  @override
  Widget build(BuildContext context) {
    Uniform u = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header2(
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
                "분류를 선택하세요",
                style: GoogleFonts.notoSans(
                    fontSize: 24, fontWeight: FontWeight.w300, height: 1),
              ),
            ),
            GestureDetector(
              onTap: () => handleSeason("동복"),
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
                              color: season == "동복" ? Colors.black : grey6)),
                      child: season == "동복"
                          ? Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            )
                          : Container(),
                    ),
                    Text(
                      "동복 (춘추복 포함)",
                      style: GoogleFonts.notoSans(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => handleSeason("하복"),
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
                              color: season == "하복" ? Colors.black : grey6)),
                      child: season == "하복"
                          ? Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            )
                          : Container(),
                    ),
                    Text(
                      "하복",
                      style: GoogleFonts.notoSans(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => handleSeason("생활복"),
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
                              color: season == "생활복" ? Colors.black : grey6)),
                      child: season == "생활복"
                          ? Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            )
                          : Container(),
                    ),
                    Text(
                      "생활복",
                      style: GoogleFonts.notoSans(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => handleSeason("체육복"),
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
                              color: season == "체육복" ? Colors.black : grey6)),
                      child: season == "체육복"
                          ? Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            )
                          : Container(),
                    ),
                    Text(
                      "체육복",
                      style: GoogleFonts.notoSans(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
