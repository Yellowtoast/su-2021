const express = require("express");
const router = express.Router();

const list = require("router/api/user/logs/uniform/purchase/list");

router.use("/list", list);

module.exports = router;
