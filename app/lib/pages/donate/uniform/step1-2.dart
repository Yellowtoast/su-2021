import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/components/header2.dart';
import 'package:schooluniform/constants/theme.dart';

class DonateStep1_2 extends StatefulWidget {
  static String url = "/donate/uniform/1-2";

  @override
  DonateStep1_2State createState() => DonateStep1_2State();
}

class DonateStep1_2State extends State<DonateStep1_2> {
  String gender;

  handleGender(String g) {
    Navigator.of(context).pop(g);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Header2(
          title: Text("교복 기부하기",
              style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black)),
          popButton: true,
          border: true,
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "성별을 선택하세요",
                      style: GoogleFonts.notoSans(
                          fontSize: 24, fontWeight: FontWeight.w300, height: 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => handleGender("남자"),
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
                                    color:
                                        gender == "남자" ? Colors.black : grey6)),
                            child: gender == "남자"
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
                            "남자",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => handleGender("여자"),
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
                                    color:
                                        gender == "여자" ? Colors.black : grey6)),
                            child: gender == "여자"
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
                            "여자",
                            style: GoogleFonts.notoSans(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
