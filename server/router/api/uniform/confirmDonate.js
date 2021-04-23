// 기부승인 (통상 센터가 교복 가져와서 교복보유중 상태로 바꿀때 사용)
// uniform 모델의 status 변경
// info model의 total count 변경

//교복 보유중 전에 상태가 무엇인지? 상태 로직 설명필요
//total count: totalDonate+1 맞는지
const express = require("express");
const router = express.Router();

const UniformModel = require("models/uniform");
const InfoModel = require("models/info");

const isAdmin = require("middlewares/auth/isAdmin");
const shopUniformPush = require("utils/shopUniformPush");

router.put("/", isAdmin, async (req, res) => {
  try {
    const { uniformId } = req.query;

    const uniform = await UniformModel.findOne({ uniformId });
    if (uniform === null) throw new Error("non exist uniform");

    uniform.status = "교복보유중";
    await Promise.all([
      uniform.save(),
      InfoModel.findOneAndUpdate(
        {},
        {
          $inc: {
            totalDonate: +1,
          },
        }
      ),
    ]);

    await shopUniformPush({
      targetUid: uniform.giverUid,
      confirm: "교복보유중",
      uniformId: uniformId,
      school: uniform["filter-school"],
      season: uniform["filter-season"],
    });

    res.status(200).json({ success: true });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: "server error",
    });
  }
});

module.exports = router;
