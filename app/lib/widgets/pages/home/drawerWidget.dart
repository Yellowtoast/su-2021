import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooluniform/constants/size.dart';
import 'package:schooluniform/routes/client/client.dart';
import 'package:schooluniform/widgets/pages/home/drawerItemWidget.dart';

import 'infoBadgeWidget.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sideDrawerWidth,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 48),
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16),
              margin: EdgeInsets.only(bottom: 24),
              child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 32,
                    height: 32,
                    padding: EdgeInsets.all(6),
                    child: Image(
                        image: AssetImage("assets/icon/close.png"),
                        width: 20,
                        height: 20),
                  )),
            ),
            DrawerItemWidget(
                label: '장바구니',
                url: Routes.userCartUrl,
                infoBadge: InfoBadge(
                  userInfoKey: "uniformCart",
                )),
            DrawerItemWidget(
                label: '교복 구매 내역',
                url: Routes.userPurchaseUniformUrl,
                infoBadge: InfoBadge(
                  userInfoKey: "uniformShop",
                )),
            DrawerItemWidget(
              label: '교복 기부 내역',
              url: Routes.userDonateUniformUrl,
              infoBadge: InfoBadge(
                userInfoKey: "uniformDonate",
              ),
            ),
            //drawer의 마지막 리스트에는 infoBadge가 들어가지 않음
            //따라서 infoBadge를 생성하기 위한 userInfoKey를 인자값으로 주지 않았음
            //오류 발생 가능성 있음
            DrawerItemWidget(
              label: '후원 내역',
              url: Routes.userSupportUrl,
            ),

            // GestureDetector(
            //   onTap: () => Get.toNamed(Routes.userSupportUrl),
            //   child: Container(
            //     height: sideDrawerItemHeight,
            //     color: Colors.transparent,
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           "후원 내역",
            //           style: GoogleFonts.notoSans(fontSize: 16),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
