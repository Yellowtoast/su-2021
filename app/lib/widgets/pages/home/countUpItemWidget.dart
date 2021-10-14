import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooluniform/configs/home_style.dart';

class CountUpItemWidget extends StatelessWidget {
  final String url;
  final String label;
  final String condition;
  final double secondaryLabel;
  CountUpItemWidget(
      {this.url, this.label, this.condition, this.secondaryLabel});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
          height: countUpItemHeight,
          child: GestureDetector(
              onTap: () => Get.toNamed(url),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: countUpItemMargin,
                      child: Text(label, style: countUpItemLabelStyle1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(condition == '' ? '' : condition,
                            style: countUpItemConditionLabelStyle),
                        Countup(
                          begin: 0,
                          end: secondaryLabel,
                          duration: countUpDuration,
                          separator: ",",
                          style: countUpItemNumberStyle,
                        ),
                        Text(" 회", style: countUpItemLabelStyle2),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
