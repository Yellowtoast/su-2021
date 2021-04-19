const express = require("express");
const isUserOrAdmin = require("middlewares/auth/isUserOrAdmin");
const UniformModel = require("models/uniform");

const router = express.Router();

router.get("/", isUserOrAdmin, async (req, res) => {
  try {
    const {
      gender = null,
      clothType = null,
      school = null,
      season = null,
      keyword = null,
      status = null,
      giverDeliveryType = null,
      receiverDeliveryType = null,
    } = req.query;

    const conditions = {};
    const andQuery = [];

    if (gender !== null) andQuery.push({ "filter-gender": gender });
    if (clothType !== null) andQuery.push({
      clothType: {
        $in: clothType,
      },
    });
    if (school !== null) andQuery.push({ "filter-school": school });
    if (season !== null) andQuery.push({ "filter-season": season });
    if (keyword !== null) andQuery.push({
      $or: [
        { "title": { $regex: keyword, $option: "$i" } },
        { "filter-school": { $regex: keyword, $option: "$i" } },
        { "filter-gender": { $regex: keyword, $option: "$i" } },
        { "filter-season": { $regex: keyword, $option: "$i" } },
        { "giverAddress": { $regex: keyword, $option: "$i" } },
        { "giverPhone": { $regex: keyword, $option: "$i" } },
        { "giverDeliveryType": { $regex: keyword, $option: "$i" } },
        { "giverName": { $regex: keyword, $option: "$i" } },
        { "receiverAddress": { $regex: keyword, $option: "$i" } },
        { "receiverPhone": { $regex: keyword, $option: "$i" } },
        { "receiverDeliveryType": { $regex: keyword, $option: "$i" } },
        { "receiverName": { $regex: keyword, $option: "$i" } },
      ],
    });
    if (status !== null) andQuery.push({ status });
    if (giverDeliveryType !== null) andQuery.push({ giverDeliveryType });
    if (receiverDeliveryType !== null) andQuery.push({ receiverDeliveryType });

    if (andQuery.length > 0) conditions["$and"] = andQuery;

    const lists = await UniformModel.find(conditions);

    res.status(200).json({
      success: true,
      data: lists,
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: "server error"
    });
  }
});

module.exports = router;
