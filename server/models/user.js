const mongoose = require("mongoose");

const modelName = "user";
const modelSchema = mongoose.Schema({
  fcm: { type: String },
  alarms: {
    total: { type: Number, default: 0 },
    uniformCart: { type: Number, default: 0 },
    uniformDonate: { type: Number, default: 0 },
    uniformShop: { type: Number, default: 0 },
  },
});

const model = mongoose.model(modelName, modelSchema);

module.exports = model;
