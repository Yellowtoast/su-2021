import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:schooluniform/constants/size.dart';

class DrawerItemWidget extends StatelessWidget {
  final String label;
  final String userInfoKey;
  final String url;
  final Widget infoBadge;
  DrawerItemWidget({this.label, this.userInfoKey, this.url, this.infoBadge});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(url),
      child: Container(
        height: sideDrawerItemHeight,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: GoogleFonts.notoSans(fontSize: 16),
            ),
            infoBadge,
          ],
        ),
      ),
    );
  }
}
