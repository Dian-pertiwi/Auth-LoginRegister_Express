const express = require("express");
const router = express.Router();
const { register } = require("../../../../BE/controllers/registerController");

router.post("/", register);

module.exports = router;
