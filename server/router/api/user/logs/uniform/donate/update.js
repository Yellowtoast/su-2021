const express = require("express");
const jwt = require("jsonwebtoken");

const UserLogModel = require("models/userLog");

const isUser = require("middlewares/auth/isUser");

const router = express.Router();

router.put("/", isUser, async (req, res) => {
  try {
    const token = req.headers["x-access-token"];
    const { userId } = jwt.decode(token);
    const { uniformId, title, thumbnail, status, showStatus } = req.body;

    const newLog = {
      uniformId,
      title,
      thumbnail,
      status,
      showStatus,
    };

    await UserLogModel.findOneAndUpdate(
      { ownerId: userId, type: "donate" },
      newLog
    );

    res.status(200).json({
      success: true,
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: "server error",
    });
  }
});

module.exports = router;
