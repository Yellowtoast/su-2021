import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';

class ImageUploaded extends StatelessWidget {
  const ImageUploaded({
    Key key,
    @required this.image,
  }) : super(key: key);

  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: MediaSize.screenWidth - 32,
      height: MediaSize.screenWidth - 32,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: FileImage(File(image.path)), fit: BoxFit.cover),
      ),
    );
  }
}
