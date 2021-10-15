import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';

class BGShopTextStyle {
// ListView Widget
  static TextStyle listViewTextStyle = GoogleFonts.notoSans(fontSize: 14);

//ListView - ListViewBadge
  static TextStyle numberBadgeTextStyle = GoogleFonts.poppins(
      fontSize: 12,
      height: 1,
      fontWeight: FontWeight.w500,
      color: Color(0xff444444));
//SelectTabView
  static TextStyle unselectedTabBarLabelStyle = TextStyle(fontSize: 14);
  static TextStyle tabBarLabelStyle =
      GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.bold);
}

class BGShopEdgeInsets {
// Filtering Box Widget
  static EdgeInsetsGeometry filterBoxPadding =
      EdgeInsets.symmetric(horizontal: 8);

// ListView Widget
  static EdgeInsetsGeometry listViewPadding =
      EdgeInsets.only(left: 16, right: 8);

//ListView - ListViewBadge
  static EdgeInsetsGeometry numberBadgePadding =
      EdgeInsets.symmetric(vertical: 4, horizontal: 8);

  static EdgeInsetsGeometry numberBadgeMargin = EdgeInsets.only(top: 2);

//SelectTabView
  static EdgeInsetsGeometry tabBarPadding = EdgeInsets.symmetric(vertical: 16);
}

class BGShopWidgetSize {
// Filtering Box Widget
  static double filterBoxHeight = 28;
  static double filterBoxIconWidth = 12;
  static double filterBoxIconHeight = 12;

// ListView Widget

  static double listViewHeight = 48;
}

class BGShopBoxDecoration {
//ListView - ListViewBadge
  static BoxDecoration numberBadgeBoxStyle = BoxDecoration(
    color: BGColors.grey2,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
}
