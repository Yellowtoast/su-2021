import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schooluniform/constants/data.dart';
import 'package:schooluniform/routes/api/uniform.dart';
import 'package:schooluniform/routes/client/client.dart';
import 'package:schooluniform/types/clothFilterData.dart';
import 'package:schooluniform/types/pageArg.dart';
import 'package:schooluniform/widgets/header/header.dart';
import 'package:schooluniform/widgets/loading/loading.dart';

import 'package:schooluniform/routes/api/networkHandler.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/list/filterOpenBox.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/list/listGridView.dart';
import 'package:schooluniform/widgets/localWidgets/shopWidgets/list/noResultPage.dart';

class ShopListPage extends StatefulWidget {
  @override
  ShopListPageState createState() => ShopListPageState();
}

class ShopListPageState extends State<ShopListPage> {
  var controller = ScrollController();

  bool loading = true;
  var uniformList = [];

  var lastDoc;

  bool infiniteScrollRunnig = false;

  void requestData() async {
    try {
      //schoolName을 리턴값으로 받는다
      ShopListPageArg arg = ModalRoute.of(context).settings.arguments;

      var gender = '';
      var season = '';
      if (filterGender != null && filterGender != '') {
        gender = '&gender=$filterGender';
      }
      if (filterSeason != null && filterSeason != '') {
        season = '&season=$filterSeason';
      }

      print(filterClothType);

      //특정 학교 > 교복보유중 > 옷 타입(리스트) + 젠더 + 시즌(동복/하복 ...)으로 api요청을 보냄
      List<Future<dynamic>> futures = [
        NetworkHandler().get(
            '${UniformApiRoutes.LIST}?school=${arg.schoolName}&status=교복보유중&clothType=${filterClothType.toString()}' +
                gender +
                season),
      ];

      //api 응답 기다림. 아마도 리스트 형태의 데이터가 날라오는듯?
      var res = await Future.wait(futures);
      List l = [];
      var _data;

      if (res[0]['data'] != null) {
        _data = res[0]['data'];

        for (var doc in _data) l.add(doc);

        setState(() {
          loading = false;
          uniformList = l;
          if (_data.length > 0) {
            lastDoc = _data[_data.length - 1];
          }
        });
      } else {
        setState(() {
          loading = false;
          uniformList = l;
        });
      }
      uniformList = l;
    } catch (err) {
      print(err);
    }
  }

  void handleGenderFilter() async {
    if (filterGender != null) {
      //성별 필터가 설정되었을 경우
      setState(() {
        filterGender = null;
        loading = true;
      });
      requestData();
    } else {
      //성별 핉터가 설정되지 않았을 경우
      //성별 필터를 고를 수 있는 페이지를 띄운다
      var genderChoosen = await Get.toNamed(
          Routes.shopListGenderFilterUrl); //선택한 젠더를 스트링 형태로 날려준다.
      if (genderChoosen != null) {
        //사용자가 성별 필터를 선택했다면
        setState(() {
          filterGender = genderChoosen;
          filterSeason = null;
          filterClothType = [];
          loading = true;
        });
        requestData();
      }
    }
  }

  void handleClothFilter() async {
    if (filterClothType.length != 0) {
      setState(() {
        filterSeason = null;
        filterClothType = [];
        loading = true;
      });
      requestData();
    } else {
      var clothesTypeChoosen = await Get.toNamed(Routes.shopListClothFilterUrl);
      ShopListClothFilterData filteredClothesData = clothesTypeChoosen;
      //ShopListClothFilterData 클래스는 두가지의 리턴값을 받아온다.
      //String season;
      //List clothType;
      if (filteredClothesData.clothType != null &&
          filteredClothesData.clothType.length != 0) {
        setState(() {
          filterSeason = filteredClothesData.season;
          filterClothType = filteredClothesData.clothType;
          loading = true;
        });
        requestData();
      }
    }
  }

  scrollListener() async {
    var triggerFetchMoreSize = 0.9 * controller.position.maxScrollExtent;

    if (controller.position.pixels > triggerFetchMoreSize) {
      if (!infiniteScrollRunnig && lastDoc != null) {
        setState(() {
          infiniteScrollRunnig = true;
        });

        try {
          ShopListPageArg arg = ModalRoute.of(context).settings.arguments;

          // var ref;
          // var ref = collectionUniforms
          //     .where("filter-school", isEqualTo: arg.schoolName)
          //     .where("status", isEqualTo: "교복보유중");

          // if (filterGender != null)
          //   ref = ref.where("filter-gender", isEqualTo: filterGender);
          // if (filterSeason != null)
          //   ref = ref.where("filter-season", isEqualTo: filterSeason);
          // if (filterClothType.length != 0)
          //   ref = ref.where("filter-clothType",
          //       arrayContainsAny: filterClothType);

          // var querySnapshot =
          //     await ref.startAfterDocument(lastDoc).limit(8).get();
          // var l = [];
          // for (var doc in querySnapshot.docs)
          //   l.add({"id": doc.id, ...doc.data()});
          setState(() {
            infiniteScrollRunnig = false;
            // list = list + l;
            // if (querySnapshot.docs.length > 0) {
            //   lastDoc = querySnapshot.docs[querySnapshot.docs.length - 1];
            // } else {
            //   lastDoc = null;
            // }
          });
        } catch (err) {
          print(err);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(microseconds: 100), () {
      requestData();
    });

    controller..addListener(scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ShopListPageArg listPageArg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        border: false,
        popButton: true,
        title: Text(
          listPageArg.schoolName,
          style: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
        ),
      ),
      body: loading
          ? LoadingPage()
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      FilterOpenBox(
                        filterHandler: handleGenderFilter,
                        firstFilter: filterGender,
                        labelText: filterLabel[0],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                      ),
                      FilterOpenBox(
                        filterHandler: handleClothFilter,
                        firstFilter: filterSeason,
                        secondFilter: filterClothType,
                        labelText: filterLabel[1],
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: uniformList.length == 0
                      ? NoResultPageWidget(
                          image: Image(
                              image:
                                  AssetImage("assets/img/bookie-parking.png"),
                              width: 100,
                              height: 100),
                          text: Text(
                            "조건에 맞는 교복이 없습니다",
                            style: GoogleFonts.notoSans(
                                fontSize: 14, color: Color(0xff444444)),
                          ),
                        )
                      : ListGridView(
                          controller: controller, uniformList: uniformList),
                )
              ],
            ),
    );
  }
}
