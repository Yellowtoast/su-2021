const express = require("express");
const mongoose = require("mongoose");
const UserModel = require("models/user");
const isMine = require("middlewares/auth/isMine");

const router = express.Router();

router.get("/", isMine, async (req, res) => {
  try {
    const { targetUid } = req.query;

    const user = await UserModel.findOne({
      _id: targetUid,
    });

    res.status(200).json(user);
  } catch (err) {
    console.log(err);
    res.status(500).json({
      success: false,
      message: "server error",
    });
  }
});

module.exports = router;
