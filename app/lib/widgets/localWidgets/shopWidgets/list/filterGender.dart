import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/widgets/header/header2.dart';

class ShopListGenderFilter extends StatefulWidget {
  @override
  ShopListGenderFilterState createState() => ShopListGenderFilterState();
}

class ShopListGenderFilterState extends State<ShopListGenderFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BGColors.grey1,
        appBar: Header2(
          popButton: true,
          title: Text(
            "성별 선택",
            style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
          ),
          border: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 10),
          children: [
            GestureDetector(
              onTap: () => Get.back(result: "남자"),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Text(
                  "남자",
                  style: GoogleFonts.notoSans(fontSize: 14),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.back(result: "여자"),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Text(
                  "여자",
                  style: GoogleFonts.notoSans(fontSize: 14),
                ),
              ),
            ),
          ],
        ));
  }
}
