const pool = require("../config/db");

exports.getMetrics = async (req, res) => {
  try {
    const purchases = await pool.query(
      "SELECT COALESCE(SUM(quantity),0) FROM purchases",
    );

    const transfers = await pool.query("SELECT COUNT(*) FROM transfers");

    const assignments = await pool.query("SELECT COUNT(*) FROM assignments");

    const expenditure = await pool.query("SELECT COUNT(*) FROM expenditure");

    res.json({
      purchases: purchases.rows[0].coalesce,
      transfers: transfers.rows[0].count,
      assignments: assignments.rows[0].count,
      expenditure: expenditure.rows[0].count,
    });
  } catch (err) {
    res.status(500).json(err.message);
  }
};
