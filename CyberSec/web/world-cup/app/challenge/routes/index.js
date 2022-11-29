const path = require("path");
const express = require("express");
const { unflatten } = require("flat");
const router = express.Router();
const Database = require("../database");

router.get("/", (_, res) => {
  return res.sendFile(path.resolve("views/index.html"));
});

router.post("/", async (req, res) => {
  require("dotenv").config({ path: "../.env" });

  const { country } = unflatten(req.body);

  if (!country || !country.name || typeof country.name != "string") {
    return res.status(400).json({
      error: "No country name provided",
    });
  }

  if (country.name === "Algeria") {
    return res
      .status(404)
      .json({ error: `<img width=400 src="/static/images/sniff.jpeg">` });
  }

  const DB_FILE = process.env.DB_FILE || "/tmp/sqlite.db";
  const TABLE_NAME = process.env.TABLE_NAME || "teams";

  const db = new Database(DB_FILE, TABLE_NAME);
  await db.connect();

  if (TABLE_NAME !== "teams") {
    obj = {};
    obj.__proto__.TABLE_NAME = undefined;
  }

  db.getCountry(country.name)
    .then((team) => {
      return res.json({
        name: team.name,
        code: team.code,
      });
    })
    .catch((e) => {
      console.log(e);
      return res.status(404).json({ error: "Country not found" });
    });
});

module.exports = router;
