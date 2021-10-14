import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/shop_school_style.dart';
import 'package:schooluniform/widgets/header/header.dart';

class SelectionTabView extends StatelessWidget {
  const SelectionTabView(
      {Key key,
      @required TabController tabController,
      this.appbarText,
      this.tabbarText1,
      this.tabbarText2,
      this.tabbarViewList1,
      this.tabbarViewList2})
      : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final Text appbarText;
  final Text tabbarText1;
  final Text tabbarText2;
  final Widget tabbarViewList1;
  final Widget tabbarViewList2;

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
            backgroundColor: Colors.white,
            appBar: Header(border: false, popButton: true, title: appbarText),
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
                    labelStyle: tabBarLabelStyle,
                    unselectedLabelColor: Color(0x80000000),
                    unselectedLabelStyle: unselectedTabBarLabelStyle,
                    controller: _tabController,
                    tabs: <Widget>[
                      Container(padding: tabBarPadding, child: tabbarText1),
                      Container(padding: tabBarPadding, child: tabbarText2),
                    ],
                  ),
                ),
                Flexible(
                  child: TabBarView(
                    controller: _tabController,
                    children: [tabbarViewList1, tabbarViewList2],
                  ),
                ),
              ],
            )));
  }
}
