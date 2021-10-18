import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/pages/shop/order/uniform/step3.dart';
import 'package:schooluniform/routes/client/client.dart';
import 'package:schooluniform/widgets/header/header.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/nextStepButton.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/selectWayWidget.dart';

class OrderStep2 extends StatefulWidget {
  @override
  OrderStep2State createState() => OrderStep2State();
}

class OrderStep2State extends State<OrderStep2> {
  String deliveryType;

  handleDeliveryType(String g) {
    setState(() {
      deliveryType = g;
    });
  }

  @override
  Widget build(BuildContext context) {
    ShopUniformInputData d = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Header(
          title: Text("구매하기 / 수령방법",
              style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black)),
          popButton: true,
          border: true,
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "교복수령방식을 선택해주세요",
                      style: GoogleFonts.notoSans(
                          fontSize: 24, fontWeight: FontWeight.w300, height: 1),
                    ),
                  ),
                  SelectWayWidget(
                    onTap: handleDeliveryType("봉사센터 방문"),
                    selected: "봉사센터 방문",
                    deliveryType: deliveryType,
                    mainLabel: "북구자원봉사센터 방문",
                    secondaryLabel: "구매자가 센터를 직접 방문하여 교복을 수령합니다",
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                  ),
                  SelectWayWidget(
                    onTap: handleDeliveryType("배송 요청"),
                    selected: "배송 요청",
                    deliveryType: deliveryType,
                    mainLabel: "배송 요청",
                    secondaryLabel: "입력하신 주소지로 택배(착불)가 발송됩니다",
                  ),
                  deliveryType == null
                      ? Container()
                      : NextStepButton(
                          active: true,
                          activeFunction: () => Get.toNamed(Routes.shopStep3Url,
                              arguments: ShopUniformInputData(
                                  code: d.code,
                                  certFront: d.certFront,
                                  certBack: d.certBack,
                                  certName: d.certName,
                                  certBirth: d.certBirth,
                                  certSchool: d.certSchool,
                                  deliveryType: deliveryType)),
                        )
                ],
              ),
            )
          ],
        ));
  }
}




//  GestureDetector(
//                     onTap: () => handleDeliveryType("배송 요청"),
//                     child: Container(
//                       height: 46,
//                       color: Colors.transparent,
//                       child: Row(
//                         children: [
//                           Container(
//                             alignment: Alignment.center,
//                             width: 18,
//                             height: 18,
//                             margin: EdgeInsets.only(right: 8),
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                     color: deliveryType == "배송 요청"
//                                         ? Colors.black
//                                         : BGColors.grey6)),
//                             child: deliveryType == "배송 요청"
//                                 ? Container(
//                                     width: 8,
//                                     height: 8,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.black),
//                                   )
//                                 : Container(),
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "배송 요청",
//                                 style: GoogleFonts.notoSans(
//                                     fontSize: 14, height: 1),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(bottom: 8),
//                               ),
//                               Text(
//                                 "입력하신 주소지로 택배(착불)가 발송됩니다",
//                                 style: GoogleFonts.notoSans(
//                                     fontSize: 12,
//                                     color: Color(0xff666666),
//                                     height: 1),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),