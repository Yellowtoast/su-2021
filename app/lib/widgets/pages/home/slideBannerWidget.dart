import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: Color(0x80000000),
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Text("${bannerPage + 1} / $totalBannerPage",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}
