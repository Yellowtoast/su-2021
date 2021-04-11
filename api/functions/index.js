const functions = require("firebase-functions");
const express = require("express");
const app = express();

app.get("/common", function (req, res) {
  res.status(200).send({
    centerAddress: "https://m.place.naver.com/place/12183810/home?entry=pll",
    centerPhone: "053-665-2288",
    officePhone: "053-665-3962",
    officePhoneDonation: "053-665-3964",
    shouldBeUpdated: false,
    totalBeforeDelivery: 2,
    totalBeforeShop: 1,
    totalBeforeStock: 0,
    totalDonate: 276,
    totalShopped: 114,
    totalStock: 121,
    updateMent: "test/ntest",
    highSchool: {
      강북고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      경명여자고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      경상고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      경상여자고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      구암고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      대구체육고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      대중금속공업고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      매천고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      성광고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      성화여자고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      영송여자고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      영진고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      운암고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      칠성고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      학남고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      함지고등학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
    },
    middleSchool: {
      강북중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      경명여자중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      관음중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      관천중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      교동중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      구암중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      대구북중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      대구일중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      대구체육중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      동변중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      동평중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      매천중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      복현중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      사수중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      산격중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      서변중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      성광중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      성화중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      운암중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      칠곡중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      침산중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      팔달중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
      학남중학교: {
        totalDonate: 12,
        totalShop: 12,
        totalStock: 12,
      },
    },
  });
});

app.get("/user/:id", (req, res) => {
  res.status(200).send({
    totalAlarms: 17,
    totalAlarmsDonate: 17,
    totalAlarmsShop: 17,
    totalAlarmsCart: 17,
  });
});

app.get("/uniform", (req, res) => {
  res.status(200).send({
    code: "210409-1234-1234",
    dateDelivery: 1234123412345,
    dateShop: "2021.04.09 17:45:00",
    dateStock: 1234123412345,
    "filter-clothType": ["넥타이"],
    "filter-gender": "남자",
    "filter-school": "복현중학교",
    "filter-season": "동복",
    giverAddress: "경대로80",
    giverDeliveryType: "수거 요청",
    giverName: "승덕",
    giverPhone: "01012341234",
    giverUid: "vivasecond_user_1",
    images: [
      "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
      "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
      "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
    ],
    receiverAddress: "경대로80",
    receiverBirth: "20100101",
    receiverCert: [],
    receiverDeliveryType: "배송 요청",
    receivername: "영광",
    receiverPhone: "01012341234",
    receiverSchool: "복현중학교",
    receiverUid: "vivasecond_user_2",
    status: "최종완료",
    totalImages: 2,
    uniforms: [
      {
        clothType: "넥타이",
        gender: "남자",
        school: "복현중학교",
        season: "동복",
        size: "free",
      },
    ],
  });
});

app.get("/user/:id/cart/list", (req, res) => {
  res.status(200).send([
    {
      id: "1",
      thumbnail:
        "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
      title: "중학교 상의",
    },
    {
      id: "2",
      thumbnail:
        "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
      title: "중학교 하의",
    },
    {
      id: "3",
      thumbnail:
        "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
      title: "중학교 넥타이",
    },
    {
      id: "4",
      thumbnail:
        "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg",
      title: "고등학교 상의",
    },
  ]);
});

exports.api = functions.https.onRequest(app);
