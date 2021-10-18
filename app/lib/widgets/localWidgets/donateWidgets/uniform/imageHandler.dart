import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';

showModal({context, label1, onClickForLabel1, label2, onClickForLabel2}) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 100 + MediaQuery.of(context).padding.bottom,
          width: MediaSize.screenWidth,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 16,
              right: 16),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: GestureDetector(
                  onTap: onClickForLabel1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 46,
                    decoration: BoxDecoration(
                        color: BGColors.grey3,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      label1,
                      style: GoogleFonts.notoSans(fontSize: 14),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: GestureDetector(
                  onTap: onClickForLabel2,
                  child: Container(
                    alignment: Alignment.center,
                    height: 46,
                    decoration: BoxDecoration(
                        color: BGColors.colorSig2,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(label2,
                        style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
