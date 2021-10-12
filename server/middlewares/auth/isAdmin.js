const jwt = require("jsonwebtoken");
const { ADMIN_JWT_KEY } = require("configs/preset");

const isAdmin = async (req, res, next) => {
  try {
    const token = req.headers["x-access-token"];
    const decoded = jwt.verify(token, ADMIN_JWT_KEY);
    next();
  } catch (err) {
    res.status(403).json({ success: false, error: "permission denied" });
  }
};

module.exports = isAdmin;
