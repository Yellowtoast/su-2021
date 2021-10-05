import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwipeBannerItemWidget extends StatelessWidget {
  final String url;
  final String imageSrc;
  SwipeBannerItemWidget({this.url, this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(url);
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight, image: AssetImage(imageSrc))),
      ),
    );
  }
}
