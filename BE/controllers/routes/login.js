const express = require("express");
const router = express.Router();
const { login } = require("../../../../BE/controllers/loginController");

router.post("/", login);

module.exports = router;
