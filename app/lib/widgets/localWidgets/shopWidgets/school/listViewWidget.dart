import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooluniform/configs/style/shopStyle.dart';
import 'package:schooluniform/routes/client/client.dart';

import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/types/pageArg.dart';

class ListViewWidget extends StatelessWidget {
  final List data;
  final String ref;
  ListViewWidget({this.data, this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var school in data)
          GestureDetector(
              onTap: () => Get.toNamed(Routes.shopListUrl,
                  arguments: ShopListPageArg(schoolName: school)),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: BGShopWidgetSize.listViewHeight,
                      color: Colors.transparent,
                      padding: BGShopEdgeInsets.listViewPadding,
                      child: Text(
                        school,
                        style: BGShopTextStyle.listViewTextStyle,
                      ),
                    ),
                    ListViewBadge(
                      text: Text(
                          BGinfoStore.localInfo[ref][school]["totalStock"]
                              .toString(),
                          style: BGShopTextStyle.numberBadgeTextStyle),
                    ),
                  ],
                ),
              ))
      ],
    );
  }
}

class ListViewBadge extends StatelessWidget {
  const ListViewBadge({Key key, this.text}) : super(key: key);

  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: BGShopEdgeInsets.numberBadgePadding,
        decoration: BGShopBoxDecoration.numberBadgeBoxStyle,
        child: Container(
          margin: BGShopEdgeInsets.numberBadgeMargin,
          child: text,
        ));
  }
}
