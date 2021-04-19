// 이름이랑 생년월일로 조회

//이름이랑 생년월일을 동시에 검색가능한지 type정해서 검색하는지
//이름(주는사람, 받는사람), 생년월일(받는사람) 다 검색가능한지?
//sort 필요한가?

const express = require("express");
const isUserOrAdmin = require("middlewares/auth/isUserOrAdmin");
const UniformModel = require("models/uniform");

const router = express.Router();

router.get("/", isUserOrAdmin, async (req, res) => {
  try {
    const { type, keyword, sort = { dateStock: 1 } } = req.query;

    const conditions = {};
    const andQuery = [];

    if (type === "name") {
      andQuery.push({
        $or: [
          { giverName: { $regex: keyword, $option: "$i" } },
          { receiverName: { $regex: keyword, $option: "$i" } },
        ],
      });
    } else if (type === "birth") {
      andQuery.push({
        receiverBirth: { $regex: keyword, $option: "$i" },
      });
    } else {
      andQuery.push({
        $or: [
          { giverName: { $regex: keyword, $option: "$i" } },
          { receiverName: { $regex: keyword, $option: "$i" } },
          {
            receiverBirth: { $regex: keyword, $option: "$i" },
          },
        ],
      });
    }

    if (andQuery.length > 0) conditions["$and"] = andQuery;

    const lists = await UniformModel.find(conditions).sort(sort);

    res.status(200).json({
      success: true,
      data: lists,
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: "server error",
    });
  }
});

module.exports = router;
