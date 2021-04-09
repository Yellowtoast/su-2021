import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:schooluniform/configs/data.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';

import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/utils/getRankingSchool.dart';

class RankingSchoolPage extends StatefulWidget {
  @override
  RankingSchoolPageState createState() => RankingSchoolPageState();
}

class RankingSchoolPageState extends State<RankingSchoolPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
            backgroundColor: Colors.white,
            appBar: Header(
              border: false,
              popButton: true,
              title: Text(
                "학교별 기부 랭킹",
                style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
              ),
            ),
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: grey2,
                    ),
                  )),
                  child: TabBar(
                    indicatorColor: colorSig1,
                    labelColor: colorSig1,
                    labelStyle: GoogleFonts.notoSans(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    unselectedLabelColor: Color(0x80000000),
                    unselectedLabelStyle: TextStyle(fontSize: 14),
                    controller: _tabController,
                    tabs: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "중학교",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "고등학교",
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView(
                        padding: EdgeInsets.only(top: 36, bottom: 36),
                        children: [
                          // for (var school in getRankingSchool(
                          //     infoStore.localInfo["middleSchool"]))
                          //   Container(
                          //       margin: EdgeInsets.only(bottom: 36),
                          //       alignment: Alignment.centerLeft,
                          //       padding: EdgeInsets.symmetric(horizontal: 16),
                          //       child: Column(
                          //         children: [
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.center,
                          //             children: [
                          //               Row(
                          //                 children: [
                          //                   Text(
                          //                     "${school["rank"] < 10 ? 0 : ""}${school["rank"]}",
                          //                     style: GoogleFonts.montserrat(
                          //                         fontSize: 16,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: colorSig2),
                          //                   ),
                          //                   Container(
                          //                     margin: EdgeInsets.only(left: 12),
                          //                     child: Text(
                          //                       "${school["school"]}",
                          //                       style: GoogleFonts.notoSans(
                          //                           fontSize: 14),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //               Row(
                          //                 children: [
                          //                   Text("${school["total"]}",
                          //                       style: GoogleFonts.montserrat(
                          //                         fontSize: 14,
                          //                       )),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //           Stack(
                          //             children: [
                          //               Container(
                          //                 margin: EdgeInsets.only(top: 8),
                          //                 width: MediaQuery.of(context)
                          //                         .size
                          //                         .width -
                          //                     32,
                          //                 height: 8,
                          //                 decoration: BoxDecoration(
                          //                   color: grey2,
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(2)),
                          //                 ),
                          //               ),
                          //               Container(
                          //                 margin: EdgeInsets.only(top: 8),
                          //                 width: school["total"] == 0
                          //                     ? 0
                          //                     : (MediaQuery.of(context)
                          //                                 .size
                          //                                 .width -
                          //                             32) *
                          //                         (school["total"] /
                          //                             school["maxValue"]),
                          //                 height: 8,
                          //                 decoration: BoxDecoration(
                          //                   gradient: gradSig,
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(2)),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       )),
                        ],
                      ),
                      ListView(
                        padding: EdgeInsets.only(top: 36, bottom: 36),
                        children: [
                          // for (var school in getRankingSchool(
                          //     infoStore.localInfo["highSchool"]))
                          //   Container(
                          //       margin: EdgeInsets.only(bottom: 36),
                          //       alignment: Alignment.centerLeft,
                          //       padding: EdgeInsets.symmetric(horizontal: 16),
                          //       child: Column(
                          //         children: [
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.center,
                          //             children: [
                          //               Row(
                          //                 children: [
                          //                   Text(
                          //                     "${school["rank"] < 10 ? 0 : ""}${school["rank"]}",
                          //                     style: GoogleFonts.montserrat(
                          //                         fontSize: 16,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: colorSig2),
                          //                   ),
                          //                   Container(
                          //                     margin: EdgeInsets.only(left: 12),
                          //                     child: Text(
                          //                       "${school["school"]}",
                          //                       style: GoogleFonts.notoSans(
                          //                           fontSize: 14),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //               Row(
                          //                 children: [
                          //                   Text("${school["total"]}",
                          //                       style: GoogleFonts.montserrat(
                          //                         fontSize: 14,
                          //                       )),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //           Stack(
                          //             children: [
                          //               Container(
                          //                 margin: EdgeInsets.only(top: 8),
                          //                 width: MediaQuery.of(context)
                          //                         .size
                          //                         .width -
                          //                     32,
                          //                 height: 8,
                          //                 decoration: BoxDecoration(
                          //                   color: grey2,
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(2)),
                          //                 ),
                          //               ),
                          //               Container(
                          //                 margin: EdgeInsets.only(top: 8),
                          //                 width: school["total"] == 0
                          //                     ? 0
                          //                     : (MediaQuery.of(context)
                          //                                 .size
                          //                                 .width -
                          //                             32) *
                          //                         (school["total"] /
                          //                             school["maxValue"]),
                          //                 height: 8,
                          //                 decoration: BoxDecoration(
                          //                   gradient: gradSig,
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(2)),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
