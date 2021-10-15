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
                      height: ShopWidgetSize.listViewHeight,
                      color: Colors.transparent,
                      padding: ShopEdgeInsets.listViewPadding,
                      child: Text(
                        school,
                        style: ShopTextStyle.listViewTextStyle,
                      ),
                    ),
                    ListViewBadge(
                      text: Text(
                          infoStore.localInfo[ref][school]["totalStock"]
                              .toString(),
                          style: ShopTextStyle.numberBadgeTextStyle),
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
        padding: ShopEdgeInsets.numberBadgePadding,
        decoration: ShopBoxDecoration.numberBadgeBoxStyle,
        child: Container(
          margin: ShopEdgeInsets.numberBadgeMargin,
          child: text,
        ));
  }
}
