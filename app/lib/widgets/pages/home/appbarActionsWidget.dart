import 'package:flutter/material.dart';
import 'infoBadgeWidget.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon(
      {Key key,
      @required GlobalKey<ScaffoldState> drawerKey,
      this.icon,
      this.onPress})
      : _drawerKey = drawerKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _drawerKey;
  final Image icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPress,
        child: Stack(
          children: [
            Container(
              child: icon,
              margin: EdgeInsets.only(right: 2),
            ),
            Positioned(top: 0, right: 0, child: InfoBadge(userInfoKey: "total"))
          ],
        ),
      ),
    );
  }
}
