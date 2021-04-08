import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/constants/theme.dart';

class CountUpItemWidget extends StatelessWidget {
  final String url;
  final 

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
          height: 76,
          child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(url),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "최다 기부 학교",
                        style: GoogleFonts.notoSans(
                            fontSize: 12, color: textGrey2, height: 1.17),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            '', // "${getMostDonateSchool(infoStore.localInfo["middleSchool"], infoStore.localInfo["highSchool"])["school"]} ",
                            style: GoogleFonts.notoSans(
                                fontSize: 12,
                                color: textGrey2,
                                fontWeight: FontWeight.bold)),
                        Countup(
                          begin: 0,
                          end:
                              100, //getMostDonateSchool(infoStore.localInfo["middleSchool"], infoStore.localInfo["highSchool"])["totalDonate"].toDouble()
                          duration: Duration(seconds: 2),
                          separator: ",",
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textGrey2),
                        ),
                        Text(" 회",
                            style: GoogleFonts.notoSans(
                                fontSize: 12, color: textGrey2)),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
