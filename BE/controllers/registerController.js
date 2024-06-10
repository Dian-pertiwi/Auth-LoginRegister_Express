const connection = require("../library/database");
const bcrypt = require("bcryptjs");

const register = (req, res) => {
  const { nama_depan, nama_belakang, email, password, no_tlpn, role } =
    req.body;
  const hashedPassword = bcrypt.hashSync(password, 8);

  const query =
    "INSERT INTO tbl_user (nama_depan, nama_belakang, email, password, no_tlpn, role, create_time) VALUES (?, ?, ?, ?, ?, ?, NOW())";
  connection.query(
    query,
    [nama_depan, nama_belakang, email, hashedPassword, no_tlpn, role],
    (err, results) => {
      if (err) throw err;
      res.status(201).send({ message: "User registered successfully!" });
    }
  );
};

module.exports = { register };
