const express = require("express");
const router = express.Router();
const verifyToken = require("../../../../BE/library/verify");

router.use("/login", require("./login"));
router.use("/register", require("./register"));

module.exports = router;
