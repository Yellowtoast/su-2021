import 'package:flutter/material.dart';
import 'package:schooluniform/configs/style/mediaSize.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/list/productCard.dart';

class ListGridView extends StatelessWidget {
  const ListGridView({
    Key key,
    @required this.controller,
    @required this.uniformList,
  }) : super(key: key);

  final ScrollController controller;
  final List uniformList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        controller: controller,
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio:
            (MediaSize.screenWidth / 2) / ((MediaSize.screenWidth / 2) + 116),
        children: [
          for (var uniformData in uniformList) ProductCard(uniformData),
        ]);
  }
}
