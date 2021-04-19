//전부 업데이트하는건가? 업데이트 항목 필요

const express = require("express");

const isUserOrAdmin = require("middlewares/auth/isUserOrAdmin");

const router = express.Router();

router.put("/", isUserOrAdmin, async (req, res) => {
  try {
    const { uniformId } = req.query;

    res.status(200).json({ success: true });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: "server error",
    });
  }
});

module.exports = router;
