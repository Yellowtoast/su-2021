import 'package:flutter/material.dart';
import 'package:schooluniform/configs/home_style.dart';

class SlideBannerWidget extends StatelessWidget {
  const SlideBannerWidget(
      {Key key,
      @required this.bannerController,
      @required this.bannerPage,
      @required this.totalBannerPage,
      @required this.onPageChanged,
      @required this.bannerItems})
      : super(key: key);

  final PageController bannerController;
  final int bannerPage;
  final int totalBannerPage;
  final List<Widget> bannerItems;
  final Function onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: bannerController,
          onPageChanged: onPageChanged,
          children: bannerItems,
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: Container(
            padding: slideBannerIndexBoxPadding,
            decoration: slideBannerIndexBoxStyle,
            child: Text("${bannerPage + 1} / $totalBannerPage",
                style: slideBannerIndexTextStyle),
          ),
        )
      ],
    );
  }
}
