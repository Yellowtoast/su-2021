const express = require("express");
const UserModel = require("models/user");

const isMine = require("middlewares/auth/isMine");

const router = express.Router();

router.put("/", isMine, async (req, res) => {
  const { targetUid } = req.query;
  const { total, uniformCart, uniformShop, uniformDonate } = req.body;

  const updated = {};
  if (total) updated["total"] = total;
  if (uniformCart) updated["uniformCart"] = uniformCart;
  if (uniformShop) updated["uniformShop"] = uniformShop;
  if (uniformDonate) updated["uniformDonate"] = uniformDonate;

  await UserModel.updateOne({ _id: targetUid }, updated);

  res.status(200).json({ success: true });
});

module.exports = router;
