import 'package:flutter/material.dart';
import 'package:schooluniform/configs/boxDeco.dart';
import 'package:schooluniform/configs/color.dart';

class NextStepButton extends StatelessWidget {
  const NextStepButton({Key key, @required this.active, this.activeFunction})
      : super(key: key);

  final Function activeFunction;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 24),
      child: GestureDetector(
          onTap: activeFunction,
          child: active
              ? Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: BGColors.gradSig,
                      boxShadow: [BGBoxShadow.shadowSig]),
                  padding: EdgeInsets.all(18),
                  child: Image(
                    image: AssetImage("assets/icon/arrow-right-white.png"),
                    width: 16,
                    height: 16,
                  ),
                )
              : Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(color: BGColors.grey6),
                  padding: EdgeInsets.all(18),
                  child: Image(
                    image: AssetImage("assets/icon/arrow-right-white.png"),
                    width: 16,
                    height: 16,
                  ),
                )),
    );
  }
}
