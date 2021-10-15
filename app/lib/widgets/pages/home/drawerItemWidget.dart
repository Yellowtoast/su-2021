import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:schooluniform/configs/style/homeStyle.dart';

class DrawerItemWidget extends StatelessWidget {
  final String label;
  final String userInfoKey;
  final String url;
  final Widget infoBadgeItem;
  DrawerItemWidget(
      {this.label, this.userInfoKey, this.url, this.infoBadgeItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(url),
      child: Container(
        height: HomeWidgetSize.drawerItemHeight,
        color: Colors.transparent,
        padding: HomeEdgeInsets.drawerItemPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: HomeTextStyle.drawerItemStyle,
            ),
            infoBadgeItem,
          ],
        ),
      ),
    );
  }
}
