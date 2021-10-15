import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';

/* HOME */

const Duration countUpDuration = Duration(seconds: 2);
const int changeInfoBadgeSizeByNumber = 10;

class HomeBorderRadius {
//Banner Button
  static BorderRadiusGeometry bannerButtonRadius =
      BorderRadius.all(Radius.circular(8));
  static BorderRadiusGeometry bannerButtonIconRadius = BorderRadius.only(
      bottomRight: Radius.circular(8), topRight: Radius.circular((8)));
}

class HomeTextStyle {
//Home - SideBanner
  static TextStyle slideBannerIndexStyle = GoogleFonts.montserrat(
    fontSize: 12,
    color: Colors.white,
  );
//infoBadge
  static TextStyle infoBadgeStyle = GoogleFonts.montserrat(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 1);
//drawerItem
  static TextStyle drawerItemStyle = GoogleFonts.notoSans(fontSize: 16);
//bannerButton
  static TextStyle bannerButtonLabelStyle = GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: BGColors.textHeading1,
      height: 1);
  static TextStyle bannerButtonSecondaryLabelStyle = GoogleFonts.notoSans(
      fontSize: 10, color: BGColors.textContent1, height: 1);
//countUpItem
  static TextStyle countUpItemLabelStyle1 = GoogleFonts.notoSans(
      fontSize: 12, color: BGColors.textGrey2, height: 1.17);
  static TextStyle countUpItemLabelStyle2 =
      GoogleFonts.notoSans(fontSize: 12, color: BGColors.textGrey2);
  static TextStyle countUpItemConditionLabelStyle = GoogleFonts.notoSans(
      fontSize: 12, color: BGColors.textGrey2, fontWeight: FontWeight.bold);
  static TextStyle countUpItemNumberStyle = GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.bold, color: BGColors.textGrey2);
}

class HomeEdgeInsets {
//Appbar
  static EdgeInsetsGeometry appbarIconMargin = EdgeInsets.only(right: 2);
//Slide Banner
  static EdgeInsetsGeometry slideBannerIndexBoxPadding =
      EdgeInsets.symmetric(horizontal: 12, vertical: 6);

//Info Badge
  static EdgeInsetsGeometry infoBadgePadding = EdgeInsets.only(left: 1);

//Side Drawer
  static EdgeInsetsGeometry sideDrawerPadding = EdgeInsets.only(right: 16);
  static EdgeInsetsGeometry sideDrawerMargin = EdgeInsets.only(bottom: 24);
  static EdgeInsetsGeometry sideDrawerListPadding = EdgeInsets.only(top: 48);
  static EdgeInsetsGeometry sideDrawerIconBoxPadding = EdgeInsets.all(6);

//Drawer Item
  static EdgeInsetsGeometry drawerItemPadding =
      EdgeInsets.symmetric(horizontal: 20);

//Banner Button
  static EdgeInsetsGeometry bannerButtonPadding = EdgeInsets.only(left: 24);
  static EdgeInsetsGeometry bannerButtonTextPadding =
      EdgeInsets.only(bottom: 8);
  static EdgeInsetsGeometry bannerButtonIconMagin = EdgeInsets.only(right: 8);

//Count up Item
  static EdgeInsetsGeometry countUpItemMargin = EdgeInsets.only(bottom: 8);
}

class HomeWidgetSize {
  //Info Badge
  static double infoBadgeMinWidth = 16;
  static double infoBadgeMaxWidth = 20;
  static double infoBadgeHeight = 16;

  //Side Drawer
  static double sideDrawerWidth = 241;
  static double sideDrawerIconBoxWidth = 32;
  static double sideDrawerIconBoxHeight = 32;
  static double sideDrawerIconImgWidth = 20;
  static double sideDrawerIconImgHeight = 20;

  //Drawer Item
  static double drawerItemHeight = 48;

  //Banner Button
  static double bannerButtonHeight = 80;
  static double bannerButtonIconWidth = 64;
  static double bannerButtonIconHight = 64;

  //CountUpItem
  static double countUpItemHeight = 76;

  //AppbarIcon
  static double appbarIconWidth = 32;
  static double appbarIconHeight = 32;
}

class HomeBoxDecoration {
  //Slide Banner

  static BoxDecoration slideBannerIndexBoxStyle = BoxDecoration(
      color: Color(0x80000000),
      borderRadius: BorderRadius.all(Radius.circular(14)));
  //Info Badge
  static Decoration infoBadgeBoxStyle = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    color: BGColors.colorAlert,
  );
}
