import "package:flutter/material.dart";
import 'dart:async';
import 'package:schooluniform/configs/style/mediaSize.dart';

class LoadingPage extends StatefulWidget {
  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (mounted) {
        setState(() {
          index = (index + 1) % 8;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaSize.screenWidth,
      height: MediaSize.screenHeight,
      decoration: BoxDecoration(color: Color(0xcc000000)),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage("assets/icon/loading${index + 1}.png"))),
      ),
    );
  }
}
