import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/components/header.dart';
import 'package:schooluniform/configs/data.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/constants/theme.dart';
import 'package:schooluniform/pages/shop/list/page.dart';

class ShopFilterPage extends StatefulWidget {
  static String url = "/shop/filter";

  @override
  ShopFilterPageState createState() => ShopFilterPageState();
}

class ShopFilterPageState extends State<ShopFilterPage>
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
                "학교 선택",
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
                        children: [
                          for (var i in middleSchools)
                            GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                    ShopListPage.url,
                                    arguments: ShopListPageArg(schoolName: i)),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: 48,
                                        color: Colors.transparent,
                                        padding:
                                            EdgeInsets.only(left: 16, right: 8),
                                        child: Text(
                                          i,
                                          style: GoogleFonts.notoSans(
                                              fontSize: 14),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: grey2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Container(
                                            margin: EdgeInsets.only(top: 2),
                                            child: Text(
                                              infoStore
                                                  .localInfo["middleSchool"][i]
                                                      ["totalStock"]
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  height: 1,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff444444)),
                                            )),
                                      ),
                                    ],
                                  ),
                                ))
                        ],
                      ),
                      ListView(
                        children: [
                          for (var i in highSchools)
                            GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                    ShopListPage.url,
                                    arguments: ShopListPageArg(schoolName: i)),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: 48,
                                        color: Colors.transparent,
                                        padding:
                                            EdgeInsets.only(left: 16, right: 8),
                                        child: Text(
                                          i,
                                          style: GoogleFonts.notoSans(
                                              fontSize: 14),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: grey2,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.only(top: 2),
                                            child: Text(
                                              infoStore.localInfo["highSchool"]
                                                      [i]["totalStock"]
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  height: 1,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff444444)),
                                            ),
                                          )),
                                    ],
                                  ),
                                ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
