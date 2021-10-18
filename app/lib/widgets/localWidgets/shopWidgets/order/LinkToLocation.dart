import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkToLocation extends StatelessWidget {
  const LinkToLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launch(BGinfoStore.localInfo["centerAddress"]),
      child: Text(
        "위치보기",
        style: GoogleFonts.notoSans(
            color: BGColors.colorSig1,
            fontWeight: FontWeight.bold,
            fontSize: 12),
      ),
    );
  }
}
