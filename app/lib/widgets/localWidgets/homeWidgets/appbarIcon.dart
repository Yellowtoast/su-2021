import 'package:flutter/material.dart';
import 'package:schooluniform/configs/style/homeStyle.dart';
import 'infoBadge.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon(
      {Key key,
      @required GlobalKey<ScaffoldState> drawerKey,
      this.icon,
      this.onPress,
      this.userInfoKey})
      : _drawerKey = drawerKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _drawerKey;
  final Image icon;
  final Function onPress;
  final String userInfoKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HomeWidgetSize.appbarIconWidth,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPress,
        child: Stack(
          children: [
            Container(
              child: icon,
              margin: HomeEdgeInsets.appbarIconMargin,
            ),
            Positioned(
                top: 0, right: 0, child: InfoBadge(userInfoKey: userInfoKey))
          ],
        ),
      ),
    );
  }
}
