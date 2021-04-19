const express = require("express");
const mongoose = require("mongoose");
const UserModel = require("models/user");
const isMine = require("middlewares/auth/isMine");

const router = express.Router();

router.get("/", isMine, async (req, res) => {
  const { targetUid } = req.query;

  const user = await UserModel.findOne({ _id: targetUid });

  res.status(200).json(user);
});

module.exports = router;
