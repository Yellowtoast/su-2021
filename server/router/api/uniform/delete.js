//total count: totalBeforeDelivery: +1 맞는지

const express = require("express");
const isAdmin = require("middlewares/auth/isAdmin");
const UniformModel = require("models/uniform");
const InfoModel = require("models/info");

const router = express.Router();

router.get("/", isAdmin, async (req, res) => {
  try {
    const { uniformId } = req.query;

    // 사진도 삭제,
    // info model의 토탈카운드 조정
    await Promise.all([
      UniformModel.deleteOne({ uniformId }),
      InfoModel.findOneAndUpdate(
        {},
        {
          $inc: {
            totalBeforeDelivery: +1,
          },
        }
      ),
    ]);

    res.status(200).json({ success: true });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: "server error",
    });
  }
});

module.exports = router;
