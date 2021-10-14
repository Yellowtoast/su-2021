import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:schooluniform/configs/home_style.dart';

import 'package:schooluniform/constants/size.dart';

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
        height: drawerItemHeight,
        color: Colors.transparent,
        padding: drawerItemPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: drawerItemFontStyle,
            ),
            infoBadgeItem,
          ],
        ),
      ),
    );
  }
}
