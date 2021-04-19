const express = require("express");
const router = express.Router();

const signin = require("router/api/admin/signin");

router.use("/signin", signin);

module.exports = router;
