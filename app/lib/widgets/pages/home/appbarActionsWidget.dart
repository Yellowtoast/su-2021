import 'package:flutter/material.dart';
import 'package:schooluniform/configs/home_style.dart';
import 'infoBadgeWidget.dart';

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
      width: AppbarIconWidth,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPress,
        child: Stack(
          children: [
            Container(
              child: icon,
              margin: AppbarIconMargin,
            ),
            Positioned(
                top: 0, right: 0, child: InfoBadge(userInfoKey: userInfoKey))
          ],
        ),
      ),
    );
  }
}
