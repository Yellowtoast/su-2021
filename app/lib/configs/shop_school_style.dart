import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';

/* SHOP > SCHOOL */

// Filtering Box Widget
const EdgeInsetsGeometry filterBoxPadding = EdgeInsets.symmetric(horizontal: 8);
const double filterBoxHeight = 28;
const double filterBoxIconWidth = 12;
const double filterBoxIconHeight = 12;

// ListView Widget

const double listViewHeight = 48;
const EdgeInsetsGeometry listViewPadding = EdgeInsets.only(left: 16, right: 8);
final TextStyle listViewTextStyle = GoogleFonts.notoSans(fontSize: 14);

//ListView - ListViewBadge

final TextStyle numberBadgeTextStyle = GoogleFonts.poppins(
    fontSize: 12,
    height: 1,
    fontWeight: FontWeight.w500,
    color: Color(0xff444444));

final BoxDecoration numberBadgeBoxStyle = BoxDecoration(
  color: grey2,
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

const EdgeInsetsGeometry numberBadgePadding =
    EdgeInsets.symmetric(vertical: 4, horizontal: 8);

const EdgeInsetsGeometry numberBadgeMargin = EdgeInsets.only(top: 2);
