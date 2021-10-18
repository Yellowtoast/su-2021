import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/pages/shop/show/page.dart';
import 'package:schooluniform/routes/api/networkHandler.dart';
import 'package:schooluniform/routes/client/client.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';

Widget ProductCard(data) {
  String title = "${data["filter-gender"]} / ${data["filter-season"]} - ";
  List clothes = [];
  for (var uniform in data["uniforms"]) {
    title += "${uniform["clothType"]} (사이즈: ${uniform["size"]}), ";
  }

  if (data["filter-clothType"].indexOf("자켓") != -1) clothes.add("jacket");
  if (data["filter-clothType"].indexOf("셔츠") != -1) clothes.add("shirts-long");
  if (data["filter-clothType"].indexOf("상의") != -1)
    clothes.add(data["filter-season"] == "체육복" ? "jersey" : "shirts-short");
  if (data["filter-clothType"].indexOf("바지") != -1) clothes.add("pants");
  if (data["filter-clothType"].indexOf("하의") != -1) clothes.add("pants");
  if (data["filter-clothType"].indexOf("치마") != -1) clothes.add("skirts");
  if (data["filter-clothType"].indexOf("넥타이") != -1) clothes.add("necktie");
  if (data["filter-clothType"].indexOf("조끼") != -1) clothes.add("vest");

  if (clothes.length > 4) {
    clothes.removeRange(4, clothes.length);
    clothes.add("plus-extra");
  }

  return GestureDetector(
    onTap: () => Get.toNamed(Routes.shopShowUrl,
        arguments: ShopUniformShowArg(data: data)),
    child: Column(
      children: [
        Container(
          width: (MediaSize.screenWidth / 2),
          height: (MediaSize.screenWidth / 2),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkHandler().getImage(data["images"][0]),
                  fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 12),
              width: (MediaSize.screenWidth / 2) - 24,
              child: Text(
                title,
                style: GoogleFonts.notoSans(
                    fontSize: 14, height: 1.57, color: Color(0xff444444)),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var t in clothes)
                  t != "plus-extra"
                      ? Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: BGColors.grey2,
                          ),
                          child: Image(
                            image: AssetImage("assets/icon/$t-grey.png"),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image(
                            image: AssetImage(
                              "assets/icon/$t-grey.png",
                            ),
                            width: 8,
                            height: 8,
                          ),
                        )
              ],
            ),
          ],
        )
      ],
    ),
  );
}
