const express = require("express");
const app = express();
const routes = require("./routes");
const path = require("path");
const Database = require("./database");

app.use(express.json());
app.set("views", "./views");
app.use("/static", express.static(path.resolve("static")));

app.use(routes);

(async () => {
  require("dotenv").config({ path: ".env" });

  const NODE_PORT = parseInt(process.env.NODE_PORT) || 5000;
  const DB_FILE = process.env.DB_FILE || "/tmp/sqlite.db";
  const TABLE_NAME = process.env.TABLE_NAME || "teams";

  const db = new Database(DB_FILE, TABLE_NAME);
  await db.connect();
  await db.migrate();
  await db.close();

  app.listen(NODE_PORT, () => console.log(`Listening on port ${NODE_PORT}`));
})();
