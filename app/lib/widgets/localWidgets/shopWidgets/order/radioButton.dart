import 'package:flutter/material.dart';
import 'package:schooluniform/configs/color.dart';

class RadioButton extends StatelessWidget {
  const RadioButton(
      {Key key, @required this.deliveryType, @required this.selected})
      : super(key: key);

  final String deliveryType;
  final String selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 18,
      height: 18,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: deliveryType == selected ? Colors.black : BGColors.grey6)),
      child: deliveryType == selected
          ? Container(
              width: 8,
              height: 8,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            )
          : Container(),
    );
  }
}
