import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/order/imageUploaded.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox(
      {Key key,
      this.image,
      this.label,
      this.textBeforeUpload,
      this.textAfterUpload,
      this.funcAfterUpload,
      this.funcBeforeUpload})
      : super(key: key);

  final image;

  final String label;
  final String textBeforeUpload;
  final String textAfterUpload;
  final Function funcAfterUpload;
  final Function funcBeforeUpload;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 24, left: 16, right: 16),
        padding: EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: BGColors.grey2, width: 1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff444444)),
            ),
            image == null ? Container() : ImageUploaded(image: image),
            SizedBox(
              width: 12,
            ),
            UploadButton(
              onTap: () {
                if (image == null)
                  funcBeforeUpload;
                else
                  funcAfterUpload;
              },
              text: image == null ? textAfterUpload : textBeforeUpload,
            ),
          ],
        ));
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton({Key key, this.onTap, this.text}) : super(key: key);

  final Function onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaSize.screenWidth,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: BGColors.grey2,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text(
          text,
          style: GoogleFonts.notoSans(fontSize: 14),
        ),
      ),
    );
  }
}
