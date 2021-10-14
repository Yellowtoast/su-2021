import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';

/* HOME */

//Appbar
const EdgeInsetsGeometry AppbarIconMargin = EdgeInsets.only(right: 2);
const double AppbarIconWidth = 48;

//Slide Banner
const EdgeInsetsGeometry slideBannerIndexBoxPadding =
    EdgeInsets.symmetric(horizontal: 12, vertical: 6);

const BoxDecoration slideBannerIndexBoxStyle = BoxDecoration(
    color: Color(0x80000000),
    borderRadius: BorderRadius.all(Radius.circular(14)));

final TextStyle slideBannerIndexTextStyle = GoogleFonts.montserrat(
  fontSize: 12,
  color: Colors.white,
);

//Info Badge
const double infoBadgeMinWidth = 16;
const double infoBadgeMaxWidth = 20;
const double infoBadgeHeight = 16;
const EdgeInsetsGeometry infoBadgePadding = EdgeInsets.only(left: 1);
const int changeInfoBadgeSizeByNumber = 10;
final TextStyle infoBadgeFontStyle = GoogleFonts.montserrat(
    fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white, height: 1);
final Decoration infoBadgeBoxStyle = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  color: colorAlert,
);

//Side Drqwer
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
final TextStyle drawerItemFontStyle = GoogleFonts.notoSans(fontSize: 16);
const EdgeInsetsGeometry drawerItemPadding =
    EdgeInsets.symmetric(horizontal: 20);

//Banner Button
const double bannerButtonHeight = 80;
const BorderRadiusGeometry bannerButtonRadius =
    BorderRadius.all(Radius.circular(8));
const EdgeInsetsGeometry bannerButtonPadding = EdgeInsets.only(left: 24);
const EdgeInsetsGeometry bannerButtonTextPadding = EdgeInsets.only(bottom: 8);
final TextStyle bannerButtonLabelStyle = GoogleFonts.notoSans(
    fontSize: 14, fontWeight: FontWeight.bold, color: textHeading1, height: 1);
final TextStyle bannerButtonSecondaryLabelStyle =
    GoogleFonts.notoSans(fontSize: 10, color: textContent1, height: 1);
const BorderRadiusGeometry bannerButtonIconRadius = BorderRadius.only(
    bottomRight: Radius.circular(8), topRight: Radius.circular((8)));
const EdgeInsetsGeometry bannerButtonIconMagin = EdgeInsets.only(right: 8);
const double bannerButtonIconWidth = 64;
const double bannerButtonIconHight = 64;
//Count up Item
const double countUpItemHeight = 76;
const EdgeInsetsGeometry countUpItemMargin = EdgeInsets.only(bottom: 8);
final TextStyle countUpItemLabelStyle1 =
    GoogleFonts.notoSans(fontSize: 12, color: textGrey2, height: 1.17);
final TextStyle countUpItemLabelStyle2 =
    GoogleFonts.notoSans(fontSize: 12, color: textGrey2);
final TextStyle countUpItemConditionLabelStyle = GoogleFonts.notoSans(
    fontSize: 12, color: textGrey2, fontWeight: FontWeight.bold);
final TextStyle countUpItemNumberStyle = GoogleFonts.montserrat(
    fontSize: 14, fontWeight: FontWeight.bold, color: textGrey2);
const Duration countUpDuration = Duration(seconds: 2);
