import 'package:flutter/material.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/radioButton.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/selectButtonLabel.dart';

class SelectWayWidget extends StatelessWidget {
  const SelectWayWidget(
      {Key key,
      @required this.deliveryType,
      @required this.onTap,
      @required this.selected,
      @required this.mainLabel,
      @required this.secondaryLabel})
      : super(key: key);

  final String deliveryType;
  final Function onTap;
  final String selected;
  final String mainLabel;
  final String secondaryLabel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        height: 46,
        color: Colors.transparent,
        child: Row(
          children: [
            RadioButton(
              deliveryType: deliveryType,
              selected: selected,
            ),
            SelectButtonLabel(
              mainLabel: mainLabel,
              secondaryLabel: secondaryLabel,
            )
          ],
        ),
      ),
    );
  }
}
