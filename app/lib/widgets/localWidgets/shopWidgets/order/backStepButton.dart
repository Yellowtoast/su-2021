import 'package:flutter/material.dart';

class BackStepButton extends StatelessWidget {
  const BackStepButton({Key key, @required this.activeFunction})
      : super(key: key);

  final Function activeFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 24, left: 16),
      child: GestureDetector(
          onTap: activeFunction,
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            padding: EdgeInsets.all(18),
            child: Image(
              image: AssetImage("assets/icon/arrow-left-white.png"),
              width: 16,
              height: 16,
            ),
          )),
    );
  }
}
