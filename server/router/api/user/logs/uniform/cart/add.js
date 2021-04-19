const express = require("express");
const jwt = require("jsonwebtoken");

const UserLogModel = require("models/userLog");
const UniformModel = require("models/uniform");

const isUser = require("middlewares/auth/isUser");

const router = express.Router();

router.post("/", isUser, async (req, res) => {
  try {
    const token = req.headers["x-access-token"];
    const { userId } = jwt.decode(token);

    const { uniformId } = req.body;

    const uniform = await UniformModel.findOne({ _id: uniformId });

    if (uniform === null) throw new Error("unexist uniform");

    const doc = {
      ownerId: userId,
      type: "cart",
      uniformId,
      thumbnail: uniform.images[0],
      title: uniform.title,
    };

    await doc.save();

    res.status(200).json({ success: true });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: "server error"
    });
  }
});

module.exports = router;
