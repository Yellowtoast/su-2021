import 'package:flutter/material.dart';
import 'package:schooluniform/configs/theme/color/color.dart';

class SelectedFilteringBox extends StatelessWidget {
  const SelectedFilteringBox({
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
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 28,
        alignment: Alignment.center,
        child: Row(
          children: [
            text,
            Container(
              margin: EdgeInsets.only(right: 4),
            ),
            Image(
              width: 12,
              height: 12,
              image: AssetImage("assets/icon/close-white.png"),
            )
          ],
        ));
  }
}

class UnselectedFilteringBox extends StatelessWidget {
  const UnselectedFilteringBox({
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
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 28,
        alignment: Alignment.center,
        child: text);
  }
}
