const express = require("express");

const InfoModel = require("models/info");
const isUserOrAdmin = require("middlewares/auth/isUserOrAdmin");

const router = express.Router();

router.post("/", isUserOrAdmin, async (req, res) => {
  try {
    const {
      totalStock,
      totalBeforeDelivery,
      totalBeforeShop,
      totalDonate,
      totalBeforeStock,
      totalShopped,
      schoolDonate,
    } = req.body;

    const updated = {};
    if (totalStock) updated["totalStock"] = totalStock;
    if (totalBeforeDelivery)
      updated["totalBeforeDelivery"] = totalBeforeDelivery;
    if (totalBeforeShop) updated["totalBeforeShop"] = totalBeforeShop;
    if (totalDonate) updated["totalDonate"] = totalDonate;
    if (totalBeforeStock) updated["totalBeforeStock"] = totalBeforeStock;
    if (totalShopped) updated["totalShopped"] = totalShopped;
    if (schoolDonate.length)
      updated[`${schoolDonate[0]}.${schoolDonate[1]}.${schoolDonate[2]}`] =
        schoolDonate[3];

    console.log(updated);

    await InfoModel.updateOne({}, updated);

    res.status(200).json({
      success: true,
    });
  } catch (err) {
    console.log(err);
    res.status(500).json({
      success: false,
      error: "permission denied",
    });
  }
});

module.exports = router;
