import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/home_style.dart';

class bannerButtonWidget extends StatelessWidget {
  final Color bg;
  final String url;
  final String imageSrc;
  final String label;
  final String secondaryLabel;
  bannerButtonWidget(
      {this.bg, this.url, this.imageSrc, this.label, this.secondaryLabel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(url),
      child: Container(
        height: bannerButtonHeight,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: bannerButtonRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: bannerButtonPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: bannerButtonTextPadding,
                    child: Text(
                      label,
                      style: bannerButtonLabelStyle,
                    ),
                  ),
                  Text(
                    secondaryLabel,
                    style: bannerButtonSecondaryLabelStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: bannerButtonIconMagin,
              width: bannerButtonIconWidth,
              height: bannerButtonIconHight,
              decoration: BoxDecoration(
                borderRadius: bannerButtonIconRadius,
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
