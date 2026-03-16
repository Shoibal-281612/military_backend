require("dotenv").config();
const { Pool } = require("pg");

// Render provides a DATABASE_URL. If it's not there, it falls back to your local settings.
const isProduction = process.env.NODE_ENV === "production";

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: isProduction ? { rejectUnauthorized: false } : false
});

pool.connect((err, client, release) => {
  if (err) {
    return console.error("FATAL CONNECTION ERROR:", err.message);
  }
  console.log("SUCCESS: Database connection established!");
  release();
});

module.exports = pool;