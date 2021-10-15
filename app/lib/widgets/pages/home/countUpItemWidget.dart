import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooluniform/configs/style/homeStyle.dart';

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
          height: HomeWidgetSize.countUpItemHeight,
          child: GestureDetector(
              onTap: () => Get.toNamed(url),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: HomeEdgeInsets.countUpItemMargin,
                      child: Text(label,
                          style: HomeTextStyle.countUpItemLabelStyle1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(condition == '' ? '' : condition,
                            style:
                                HomeTextStyle.countUpItemConditionLabelStyle),
                        Countup(
                          begin: 0,
                          end: secondaryLabel,
                          duration: countUpDuration,
                          separator: ",",
                          style: HomeTextStyle.countUpItemNumberStyle,
                        ),
                        Text(" 회", style: HomeTextStyle.countUpItemLabelStyle2),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
