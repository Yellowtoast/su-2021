import 'package:flutter/material.dart';

class NoResultPageWidget extends StatelessWidget {
  const NoResultPageWidget({Key key, this.image, this.text}) : super(key: key);

  final Image image;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image,
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 100),
          child: text,
        )
      ],
    );
  }
}
