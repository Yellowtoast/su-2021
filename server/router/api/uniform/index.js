const express = require("express");
const router = express.Router();

// const create = require("router/api/uniform/create");
const _delete = require("router/api/uniform/delete");
const update = require("router/api/uniform/update");
const list = require("router/api/uniform/list");
const getData = require("router/api/uniform/getData");
const requestDonate = require("router/api/uniform/requestDonate");

// router.use("/create", create);
router.use("/delete", _delete);
router.use("/update", update);
router.use("/list", list);
router.use("/getData", getData);
router.use("/donate/request", requestDonate);

module.exports = router;
