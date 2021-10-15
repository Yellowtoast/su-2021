import 'package:flutter/material.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/style/shopStyle.dart';

class SelectedFilterBox extends StatelessWidget {
  const SelectedFilterBox({
    Key key,
    @required this.text,
  }) : super(key: key);

  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: gradSig,
        ),
        padding: BGShopEdgeInsets.filterBoxPadding,
        height: BGShopWidgetSize.filterBoxHeight,
        alignment: Alignment.center,
        child: Row(
          children: [
            text,
            SizedBox(
              width: 4,
            ),
            Image(
              width: BGShopWidgetSize.filterBoxIconWidth,
              height: BGShopWidgetSize.filterBoxIconHeight,
              image: AssetImage("assets/icon/close-white.png"),
            )
          ],
        ));
  }
}

class UnselectedFilterBox extends StatelessWidget {
  const UnselectedFilterBox({
    Key key,
    this.backgroundColor,
    this.text,
  }) : super(key: key);

  final Color backgroundColor;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor,
        padding: BGShopEdgeInsets.filterBoxPadding,
        height: BGShopWidgetSize.filterBoxHeight,
        alignment: Alignment.center,
        child: text);
  }
}
