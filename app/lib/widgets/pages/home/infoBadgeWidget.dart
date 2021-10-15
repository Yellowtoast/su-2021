import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/stores.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/style/homeStyle.dart';

class InfoBadge extends StatelessWidget {
  final String userInfoKey;

  const InfoBadge({Key key, this.userInfoKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => infoStore.userInfo[userInfoKey] == 0
            ? Container()
            : Container(
                padding: HomeEdgeInsets.infoBadgePadding,
                alignment: Alignment.center,
                width: infoStore.userInfo[userInfoKey] <
                        changeInfoBadgeSizeByNumber
                    ? HomeWidgetSize.infoBadgeMinWidth
                    : HomeWidgetSize.infoBadgeMaxWidth,
                height: HomeWidgetSize.infoBadgeHeight,
                decoration: HomeBoxDecoration.infoBadgeBoxStyle,
                child: Text(infoStore.userInfo[userInfoKey].toString(),
                    style: HomeTextStyle.infoBadgeStyle),
              ));
  }
}
