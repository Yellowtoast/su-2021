import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import 'package:schooluniform/constants/data.dart';

import 'package:schooluniform/widgets/localWidgets/shop/school/listViewWidget.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/school/selecTabviewWidget.dart';

class ShopFilterPage extends StatefulWidget {
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
    return SelectionTabView(
      tabController: _tabController,
      appbarText: Text(
        "학교 선택",
        style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
      ),
      tabbarText1: Text(
        "중학교",
      ),
      tabbarText2: Text(
        "고등학교",
      ),
      tabbarViewList1:
          ListViewWidget(data: middleSchools, ref: 'middleSchools'),
      tabbarViewList2: ListViewWidget(data: highSchools, ref: 'highSchools'),
    );
  }
}
