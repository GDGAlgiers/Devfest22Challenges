const sqlite = require("sqlite-async");

class Database {
  constructor(db_file, table_name) {
    this.db_file = db_file;
    this.table_name = table_name;
    this.db = undefined;
  }

  async connect() {
    this.db = await sqlite.open(this.db_file);
  }

  async close() {
    await this.db.close();
  }

  async migrate() {
    require("dotenv").config({ path: ".env" });

    const FLAG = process.env.FLAG || "DevFest22{test}";

    return this.db.exec(`
            DROP TABLE IF EXISTS ${this.table_name};

            CREATE TABLE IF NOT EXISTS ${this.table_name} (
                id         INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                name   VARCHAR(255) NOT NULL UNIQUE,
                code   VARCHAR(255) NOT NULL UNIQUE
            );

            INSERT INTO ${this.table_name} (name, code) VALUES ("argentina", "AR");
            INSERT INTO ${this.table_name} (name, code) VALUES ("australia", "AU");
            INSERT INTO ${this.table_name} (name, code) VALUES ("belgium", "BE");
            INSERT INTO ${this.table_name} (name, code) VALUES ("brazil", "BR");
            INSERT INTO ${this.table_name} (name, code) VALUES ("cameroon", "CM");
            INSERT INTO ${this.table_name} (name, code) VALUES ("canada", "CA");
            INSERT INTO ${this.table_name} (name, code) VALUES ("costa rica", "CR");
            INSERT INTO ${this.table_name} (name, code) VALUES ("croatia", "HR");
            INSERT INTO ${this.table_name} (name, code) VALUES ("denmark", "DK");
            INSERT INTO ${this.table_name} (name, code) VALUES ("ecuador", "EC");
            INSERT INTO ${this.table_name} (name, code) VALUES ("france", "FR");
            INSERT INTO ${this.table_name} (name, code) VALUES ("germany", "DE");
            INSERT INTO ${this.table_name} (name, code) VALUES ("ghana", "GH");
            INSERT INTO ${this.table_name} (name, code) VALUES ("iran", "IR");
            INSERT INTO ${this.table_name} (name, code) VALUES ("japan", "JP");
            INSERT INTO ${this.table_name} (name, code) VALUES ("south korea", "KR");
            INSERT INTO ${this.table_name} (name, code) VALUES ("mexico", "MX");
            INSERT INTO ${this.table_name} (name, code) VALUES ("morocco", "MA");
            INSERT INTO ${this.table_name} (name, code) VALUES ("netherlands", "NL");
            INSERT INTO ${this.table_name} (name, code) VALUES ("poland", "PL");
            INSERT INTO ${this.table_name} (name, code) VALUES ("portugal", "PT");
            INSERT INTO ${this.table_name} (name, code) VALUES ("qatar", "QA");
            INSERT INTO ${this.table_name} (name, code) VALUES ("saudi arabia", "SA");
            INSERT INTO ${this.table_name} (name, code) VALUES ("senegal", "SN");
            INSERT INTO ${this.table_name} (name, code) VALUES ("serbia", "RS");
            INSERT INTO ${this.table_name} (name, code) VALUES ("spain", "ES");
            INSERT INTO ${this.table_name} (name, code) VALUES ("switzerland", "CH");
            INSERT INTO ${this.table_name} (name, code) VALUES ("tunisia", "TN");
            INSERT INTO ${this.table_name} (name, code) VALUES ("england", "GB-ENG");
            INSERT INTO ${this.table_name} (name, code) VALUES ("wales", "GB-WLS");
            INSERT INTO ${this.table_name} (name, code) VALUES ("united states", "US");
            INSERT INTO ${this.table_name} (name, code) VALUES ("uruguay", "UY");

            INSERT INTO ${this.table_name} (name, code) VALUES ("${FLAG}", "FLAG");
        `);
  }

  async getCountry(name) {
    return new Promise(async (resolve, reject) => {
      try {
        let stmt = await this.db.prepare(
          `SELECT * FROM ${this.table_name} WHERE name = lower(?)`
        );
        resolve(await stmt.get(name));
      } catch (e) {
        reject(e);
      }
    });
  }
}

module.exports = Database;
