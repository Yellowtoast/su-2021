import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:schooluniform/configs/style/homeStyle.dart';

class BannerButtonWidget extends StatelessWidget {
  final Color bg;
  final String url;
  final String imageSrc;
  final String label;
  final String secondaryLabel;
  BannerButtonWidget(
      {this.bg, this.url, this.imageSrc, this.label, this.secondaryLabel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(url),
      child: Container(
        height: HomeWidgetSize.bannerButtonHeight,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: HomeBorderRadius.bannerButtonRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: HomeEdgeInsets.bannerButtonPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: HomeEdgeInsets.bannerButtonTextPadding,
                    child: Text(
                      label,
                      style: HomeTextStyle.bannerButtonLabelStyle,
                    ),
                  ),
                  Text(
                    secondaryLabel,
                    style: HomeTextStyle.bannerButtonSecondaryLabelStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: HomeEdgeInsets.bannerButtonIconMagin,
              width: HomeWidgetSize.bannerButtonIconWidth,
              height: HomeWidgetSize.bannerButtonIconHight,
              decoration: BoxDecoration(
                borderRadius: HomeBorderRadius.bannerButtonIconRadius,
                image: DecorationImage(
                  image: AssetImage(imageSrc),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
