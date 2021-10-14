import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';

/* HOME */

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
      color: textHeading1,
      height: 1);
  static TextStyle bannerButtonSecondaryLabelStyle =
      GoogleFonts.notoSans(fontSize: 10, color: textContent1, height: 1);

  //countUpItem
  static TextStyle countUpItemLabelStyle1 =
      GoogleFonts.notoSans(fontSize: 12, color: textGrey2, height: 1.17);
  static TextStyle countUpItemLabelStyle2 =
      GoogleFonts.notoSans(fontSize: 12, color: textGrey2);
  static TextStyle countUpItemConditionLabelStyle = GoogleFonts.notoSans(
      fontSize: 12, color: textGrey2, fontWeight: FontWeight.bold);
  static TextStyle countUpItemNumberStyle = GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.bold, color: textGrey2);
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

//Slide Banner
const EdgeInsetsGeometry slideBannerIndexBoxPadding =
    EdgeInsets.symmetric(horizontal: 12, vertical: 6);

const BoxDecoration slideBannerIndexBoxStyle = BoxDecoration(
    color: Color(0x80000000),
    borderRadius: BorderRadius.all(Radius.circular(14)));

//Info Badge
const double infoBadgeMinWidth = 16;
const double infoBadgeMaxWidth = 20;
const double infoBadgeHeight = 16;
const EdgeInsetsGeometry infoBadgePadding = EdgeInsets.only(left: 1);
const int changeInfoBadgeSizeByNumber = 10;

final Decoration infoBadgeBoxStyle = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  color: colorAlert,
);

//Side Drawer
const double sideDrawerWidth = 241;
const EdgeInsetsGeometry sideDrawerPadding = EdgeInsets.only(right: 16);
const EdgeInsetsGeometry sideDrawerMargin = EdgeInsets.only(bottom: 24);
const EdgeInsetsGeometry sideDrawerListPadding = EdgeInsets.only(top: 48);
const double sideDrawerIconBoxWidth = 32;
const double sideDrawerIconBoxHeight = 32;
const EdgeInsetsGeometry sideDrawerIconBoxPadding = EdgeInsets.all(6);
const double sideDrawerIconImgWidth = 20;
const double sideDrawerIconImgHeight = 20;

//Drawer Item
const double drawerItemHeight = 48;

const EdgeInsetsGeometry drawerItemPadding =
    EdgeInsets.symmetric(horizontal: 20);

//Banner Button
const double bannerButtonHeight = 80;
const BorderRadiusGeometry bannerButtonRadius =
    BorderRadius.all(Radius.circular(8));
const EdgeInsetsGeometry bannerButtonPadding = EdgeInsets.only(left: 24);
const EdgeInsetsGeometry bannerButtonTextPadding = EdgeInsets.only(bottom: 8);

const BorderRadiusGeometry bannerButtonIconRadius = BorderRadius.only(
    bottomRight: Radius.circular(8), topRight: Radius.circular((8)));
const EdgeInsetsGeometry bannerButtonIconMagin = EdgeInsets.only(right: 8);
const double bannerButtonIconWidth = 64;
const double bannerButtonIconHight = 64;
//Count up Item
const double countUpItemHeight = 76;
const EdgeInsetsGeometry countUpItemMargin = EdgeInsets.only(bottom: 8);
const Duration countUpDuration = Duration(seconds: 2);
