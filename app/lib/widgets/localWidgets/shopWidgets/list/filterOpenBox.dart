import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/configs/color.dart';

class FilterOpenBox extends StatelessWidget {
  const FilterOpenBox(
      {Key key,
      this.filterHandler,
      this.firstFilter,
      this.secondFilter,
      this.labelText})
      : super(key: key);

  final Function filterHandler;
  final String firstFilter;
  final List<String> secondFilter;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: filterHandler,
      child: firstFilter == null //카테고리 필터가 설정되지 않았을 경우,
          ? UnselectedFilterBox(
              backgroundColor: BGColors.grey2,
              text: Text(
                labelText,
                style: GoogleFonts.notoSans(
                    fontSize: 12, color: Color(0xff444444)),
              ),
            )
          : SelectedFilterBox(
              text: Text(
                secondFilter.length == 0
                    ? labelText
                    : "$firstFilter - ${secondFilter.join(",")}",
                style: GoogleFonts.notoSans(fontSize: 12, color: Colors.white),
              ),
            ),
    );
  }
}
