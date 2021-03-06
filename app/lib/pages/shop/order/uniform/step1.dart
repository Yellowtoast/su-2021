import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/inputDeco.dart';
import 'package:schooluniform/pages/shop/order/uniform/step3.dart';
import 'package:schooluniform/routes/client/client.dart';
import 'package:schooluniform/widgets/header/header.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/backStepButton.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/freshManOrNot.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/inputTextField.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/nextStepButton.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/uploadImage.dart';

class OrderStep1 extends StatefulWidget {
  @override
  OrderStep1State createState() => OrderStep1State();
}

class OrderStep1State extends State<OrderStep1> {
  var imageFront;
  var imageBack;
  String certName;
  String certSchool;
  String certBirth;
  dynamic step = 1;

  get shadowSig => null;

  void handleStep2(v) {
    setState(() {
      step = v;
    });
  }

  final picker = ImagePicker();
  ScrollController _controller = ScrollController();

  addStudentIdImage(type) async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
    if (pickedFile != null) {
      setState(() {
        if (type == "front") imageFront = pickedFile;
        if (type == "back") imageBack = pickedFile;
        Future.delayed(Duration(milliseconds: 300), () {
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        });
      });
    }
  }

  removeStudentIdImage(type) {
    setState(() {
      if (type == "front") imageFront = null;
      if (type == "back") imageBack = null;
    });
  }

  handleImageChange(type) async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
    if (pickedFile != null) {
      setState(() {
        if (type == "front") imageFront = pickedFile;
        if (type == "back") imageBack = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var code = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: step == 1 ? BGColors.grey1 : Colors.white,
        appBar: Header(
          title: Text("???????????? / ???????????????",
              style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black)),
          popButton: true,
          border: true,
        ),
        body: step == 1
            ? ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                children: [
                  FreshmanOrNotButton(
                    onTapHandler: () {
                      handleStep2("??????");
                    },
                    text: "???????????? ???????????? (?????? ???????????????)",
                  ),
                  FreshmanOrNotButton(
                    onTapHandler: () {
                      handleStep2("??????");
                    },
                    text: "???????????? ???????????? (?????? ??????????????????)",
                  ),
                ],
              )
            : step == "??????"
                ? ListView(
                    controller: _controller,
                    padding: EdgeInsets.symmetric(vertical: 32),
                    children: [
                      UploadImageBox(
                        image: imageFront,
                        label: "????????? ??????",
                        textBeforeUpload: "????????????",
                        textAfterUpload: "????????? ?????? ?????????",
                        funcAfterUpload: () {
                          handleImageChange("front");
                        },
                        funcBeforeUpload: () {
                          addStudentIdImage("front");
                        },
                      ),
                      UploadImageBox(
                        image: imageBack,
                        label: "????????? ??????",
                        textBeforeUpload: "????????????",
                        textAfterUpload: "????????? ?????? ?????????",
                        funcAfterUpload: () {
                          handleImageChange("back");
                        },
                        funcBeforeUpload: () {
                          addStudentIdImage("back");
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackStepButton(activeFunction: () {
                            setState(() {
                              step = 1;
                            });
                          }),
                          (imageFront == null || imageBack == null)
                              ? NextStepButton(
                                  active: false,
                                )
                              : NextStepButton(
                                  active: true,
                                  activeFunction: () => Get.toNamed(
                                      Routes.shopStep2Url,
                                      arguments: ShopUniformInputData(
                                          code: code,
                                          certFront: imageFront,
                                          certBack: imageBack)),
                                )
                        ],
                      )
                    ],
                  )
                : ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    children: [
                      InputLabel(
                        text: "??????",
                      ),
                      InputTextField(
                        onChanged: (text) {
                          setState(() {
                            certName = text;
                          });
                        },
                        inputDecoration: BGinputDecoStyle("?????? ????????? ????????? ???????????????"),
                        maxTextLength: 10,
                      ),
                      InputLabel(
                        text: "??????",
                      ),
                      InputTextField(
                        onChanged: (text) {
                          setState(() {
                            certBirth = text;
                          });
                        },
                        inputDecoration: BGinputDecoStyle("???: 20050101"),
                        maxTextLength: 8,
                      ),
                      InputLabel(
                        text: "?????? ?????? ??????",
                      ),
                      InputTextField(
                        onChanged: (text) {
                          setState(() {
                            certSchool = text;
                          });
                        },
                        inputDecoration: BGinputDecoStyle("????????????????????? ??????????????????"),
                      ),

                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackStepButton(activeFunction: () {
                            setState(() {
                              step = 1;
                            });
                          }),
                          (certName == null ||
                                  certBirth == null ||
                                  certBirth.length != 8 ||
                                  certSchool == null)
                              ? NextStepButton(active: false)
                              : NextStepButton(
                                  active: true,
                                  activeFunction: () => Get.toNamed(
                                      Routes.shopStep2Url,
                                      arguments: ShopUniformInputData(
                                          code: code,
                                          certName: certName,
                                          certBirth: certBirth,
                                          certSchool: certSchool,
                                          certFront: imageFront,
                                          certBack: imageBack)),
                                )
                        ],
                      ),
                    ],
                  ));
  }
}
