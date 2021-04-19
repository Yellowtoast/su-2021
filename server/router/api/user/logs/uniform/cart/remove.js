const express = require("express");
const UserLogModel = require("models/userLog");

const isMine = require("middlewares/auth/isMine");

const router = express.Router();

router.delete("/", async (req, res) => {
  try {
    const token = req.headers["x-access-token"];
    const { userId } = jwt.decode(token);

    const { logId } = req.query;

    await UserLogModel.deleteOne({ _id: logId, ownerId: userId });

    res.status(200).json({ success: true });
  } catch (err) {
    res.status(500).json({
      success: "false",
      error: "server error",
    });
  }
});

module.exports = router;
