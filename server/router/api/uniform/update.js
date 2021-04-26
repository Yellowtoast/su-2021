const express = require("express");

const isUserOrAdmin = require("middlewares/auth/isUserOrAdmin");
const UniformModel = require("models/uniform");

const router = express.Router();

router.put("/", isUserOrAdmin, async (req, res) => {
  try {
    const { uniformId } = req.query;
    const {
      receiverUid,
      receiverName,
      receiverPhone,
      receiverAddress,
      receiverDeliveryType,
      receiverCert,
      receiverBirth,
      receiverSchool,
      status,
      images,
      uniforms,
      dateShop,
      dateStock,
      dateDelivery,
      giverUid,
      giverName,
      giverPhone,
      giverAddress,
      giverDeliveryType,
    } = req.body;

    const updated = {};

    if (receiverUid) updated["receiverUid"] = receiverUid;
    if (receiverName) updated["receiverName"] = receiverName;
    if (receiverPhone) updated["receiverPhone"] = receiverPhone;
    if (receiverAddress) update["receiverAddress"] = receiverAddress;
    if (receiverDeliveryType)
      updated["receiverDeliveryType"] = receiverDeliveryType;
    if (receiverCert) updated["receiverCert"] = receiverCert;
    if (receiverBirth) updated["receiverBirth"] = receiverBirth;
    if (receiverSchool) updated["receiverSchool"] = receiverSchool;
    if (giverUid) updated["giverUid"] = giverUid;
    if (giverName) updated["giverName"] = giverName;
    if (giverPhone) updated["giverPhone"] = giverPhone;
    if (giverAddress) updated["giverAddress"] = giverAddress;
    if (giverDeliveryType) updated["giverDeliveryType"] = giverDeliveryType;
    if (status) updated["status"] = status;
    if (images) updated["images"] = images;
    if (req.body["filter-gender"])
      updated["filter-gender"] = req.body["filter-gender"];
    if (req.body["filter-school"])
      updated["filter-school"] = req.body["filter-school"];
    if (req.body["filter-season"])
      updated["filter-season"] = req.body["filter-season"];
    if (req.body["filter-clothType"])
      updated["filter-clothType"] = req.body["filter-clothType"];
    if (uniforms) updated["uniforms"] = uniforms;
    if (dateShop) updated["dateShop"] = dateShop;
    if (dateStock) updated["dateStock"] = dateStock;
    if (dateDelivery) updated["dateDelivery"] = dateDelivery;

    console.log(uniformId);
    console.log(updated);

    const unfirom = UniformModel.findOne({ uniformId });
    consolelog(unfirom);

    await UniformModel.findOneAndUpdate({ uniformId }, updated);

    res.status(200).json({ success: true });
  } catch (err) {
    res.status(500).json({
      success: false,
      error: "server error",
    });
  }
});

module.exports = router;
