import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:schooluniform/types/uniform.dart';
import 'package:schooluniform/widgets/header/header2.dart';
import 'package:schooluniform/widgets/localWidgets/donateWidgets/uniform/selectSeason.dart';

class DonateStep1_3 extends StatefulWidget {
  @override
  DonateStep1_3State createState() => DonateStep1_3State();
}

class DonateStep1_3State extends State<DonateStep1_3> {
  String season;

  handleSeason(String g) {
    Get.back(result: g);
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
            SelectSeasonWidget(
              season: season,
              label: '동복',
              onClick: () => handleSeason("동복"),
            ),
            SelectSeasonWidget(
              season: season,
              label: '하복',
              onClick: () => handleSeason("하복"),
            ),
            SelectSeasonWidget(
              season: season,
              label: '생활복',
              onClick: () => handleSeason("생활복"),
            ),
            SelectSeasonWidget(
              season: season,
              label: '체육복',
              onClick: () => handleSeason("체육복"),
            ),
          ]),
    );
  }
}
