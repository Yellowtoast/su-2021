import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/configs/theme/color/color.dart';

class InfoBadge extends StatelessWidget {
  final String userInfoKey;

  const InfoBadge({Key key, this.userInfoKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => infoStore.userInfo[userInfoKey] == 0
            ? Container()
            : Container(
                padding: EdgeInsets.only(left: 1),
                alignment: Alignment.center,
                width: infoStore.userInfo["total"] < 10 ? 16 : 20,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: colorAlert,
                ),
                child: Text(
                  infoStore.userInfo["total"].toString(),
                  style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1),
                ),
              ));
  }
}
