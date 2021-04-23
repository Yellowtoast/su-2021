require("app-module-path").addPath(`${__dirname}`);

const express = require("express");
const path = require("path");
const bodyParser = require("body-parser");
const multer = require("multer");
const mongoose = require("mongoose");
const admin = require("firebase-admin");

const serviceAccount = require("./admin.json");
const router = require("router");

const main = async () => {
  const pwd = "test";
  const uri = `mongodb+srv://user:${pwd}@su2021-test.nqc07.mongodb.net/su2021-test?retryWrites=true&w=majority`;

  await mongoose.connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
    useCreateIndex: true,
  });

  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
  });

  const app = express();
  // app.use(express.json());
  app.use(bodyParser.json());
  app.use("/uploads", express.static("uploads"));
  app.use("/", router);

  app.listen(3000, () => {
    console.log("server on");
  });
};

main();
