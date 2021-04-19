const jwt = require("jsonwebtoken");
const { JWT_ADMIN_KEY } = require("configs/preset");

const isAdmin = async (req, res, next) => {
  try {
    const token = req.headers["x-access-token"];
    const decoded = jwt.verify(token, JWT_ADMIN_KEY);
    next();
  } catch (err) {
    res.status(403).json({ success: false, error: "permission denied" });
  }
};

module.exports = isAdmin;
