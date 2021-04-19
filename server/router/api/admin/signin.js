const express = require("express");
const jwt = require("jsonwebtoken");
const { ADMIN_JWT_KEY } = require("configs/preset");

const router = express.Router();

const PRESET = {
  "id": "admin",
  "password": "bookieuniform1!",
};

router.post("/", async (req, res) => {
  const { id, password } = req.body;

  if (id !== PRESET.id) {
    return res.status(200).json({
      success: false,
      error: "잘못된 아이디 입니다",
    });
  }

  if (password != PRESET.password) {
    return res.status(200).json({
      success: false,
      error: "잘못된 비밀번호 입니다",
    });
  }

  const token = jwt.sign({
    userType: "admin",
    exp: Math.floor(Date.now() / 1000) + (60 * 60),
  }, ADMIN_JWT_KEY);

  res.status(200).json({ success: true, token });
});

module.exports = router;
