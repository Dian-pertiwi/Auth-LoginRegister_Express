const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const connection = require("../library/database");

const login = (req, res) => {
  const { email, password } = req.body;

  // Cari pengguna berdasarkan email
  connection.query(
    "SELECT * FROM tbl_user WHERE email = ?",
    [email],
    (err, results) => {
      if (err) {
        return res.status(500).send("Internal Server Error");
      }

      // Periksa apakah pengguna ditemukan
      if (results.length === 0) {
        return res.status(404).send("User not found");
      }

      const user = results[0];

      // Bandingkan kata sandi yang di-hash
      bcrypt.compare(password, user.password, (err, passwordIsValid) => {
        if (err) {
          return res.status(500).send("Internal Server Error");
        }

        // Jika kata sandi cocok
        if (passwordIsValid) {
          // Simpan informasi pengguna di dalam sesi
          req.session.userId = user.user_id;
          req.session.userRole = user.role;

          // Buat token JWT (opsional)
          const token = jwt.sign(
            { id: user.user_id, role: user.role },
            process.env.SESS_SECRET
            // { expiresIn: 86400 } // expires in 24 hours
          );
          return res.status(200).send({ auth: true, token: token });
        }
      });
    }
  );
};

module.exports = { login };

// const argon2 = require("argon2");
// const jwt = require("jsonwebtoken");
// const connection = require("../library/database");

// const login = (req, res) => {
//   const { email, password } = req.body;

//   // Cari pengguna berdasarkan email
//   connection.query(
//     "SELECT * FROM tbl_user WHERE email = ?",
//     [email],
//     async (err, results) => {
//       if (err) {
//         return res.status(500).send("Internal Server Error");
//       }

//       // Periksa apakah pengguna ditemukan
//       if (results.length === 0) {
//         return res.status(404).send("User not found");
//       }

//       const user = results[0];

//       try {
//         // Memverifikasi kata sandi dengan Argon2
//         const passwordIsValid = await argon2.verify(user.password, password);

//         // Jika kata sandi cocok
//         if (passwordIsValid) {
//           // Buat token JWT
//           const token = jwt.sign(
//             { id: user.user_id, role: user.role },
//             "secret-key",
//             { expiresIn: 86400 } // expires in 24 hours
//           );
//           return res.status(200).send({ auth: true, token: token });
//         } else {
//           // Jika kata sandi tidak cocok
//           return res.status(401).send({ auth: false, token: null });
//         }
//       } catch (error) {
//         console.error("Error verifying password:", error);
//         return res.status(500).send("Internal Server Error");
//       }
//     }
//   );
// };

// module.exports = { login };
