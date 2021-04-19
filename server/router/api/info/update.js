const express = require("express");

const InfoModel = require("models/info");
const isUserOrAdmin = require("middlewares/auth/isUserOrAdmin");

const router = express.Router();

router.post("/", isUserOrAdmin, async (req, res) => {
  try {
    const { totalDonate, totalBeforeStock, schoolDonate } = req.body;

    const updated = {};
    updated[`${schoolDonate[0]}.${schoolDonate[1]}.totalDonate`] =
      schoolDonate[2];

    await Promise.all([
      InfoModel.findOneAndUpdate(
        {},
        {
          totalDonate,
          totalBeforeStock,
        }
      ),
      InfoModel.findOneAndUpdate({}, updated),
    ]);

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
