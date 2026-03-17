const router = require("express").Router();
const pool = require("../config/db");
const auth = require("../middleware/authmiddleware");

router.get("/", auth, async (req, res) => {
  try {
    const { base, asset } = req.query;

    let query = `

SELECT 
b.base_name,
a.name AS asset,

COALESCE(SUM(p.quantity),0) AS purchases,
COALESCE(SUM(t_in.quantity),0) AS transfer_in,
COALESCE(SUM(t_out.quantity),0) AS transfer_out,
COALESCE(SUM(asg.quantity),0) AS assignments,
COALESCE(SUM(exp.quantity),0) AS expended,

(
COALESCE(SUM(p.quantity),0)
+ COALESCE(SUM(t_in.quantity),0)
- COALESCE(SUM(t_out.quantity),0)
- COALESCE(SUM(asg.quantity),0)
- COALESCE(SUM(exp.quantity),0)
) AS current_inventory

FROM bases b
CROSS JOIN assets a

LEFT JOIN purchases p 
ON p.base_id = b.id AND p.asset_id = a.id

LEFT JOIN transfers t_in 
ON t_in.to_base = b.id AND t_in.asset_id = a.id

LEFT JOIN transfers t_out 
ON t_out.from_base = b.id AND t_out.asset_id = a.id

LEFT JOIN assignments asg 
ON asg.base_id = b.id AND asg.asset_id = a.id

LEFT JOIN expenditures exp 
ON exp.base_id = b.id AND exp.asset_id = a.id

GROUP BY b.base_name, a.name

ORDER BY b.base_name, a.name;
`;

    let values = [];
    let count = 1;

    if (base) {
      query += ` AND b.id=$${count}`;
      values.push(base);
      count++;
    }

    if (asset) {
      query += ` AND a.id=$${count}`;
      values.push(asset);
      count++;
    }

    const result = await pool.query(query, values);

    res.json(result.rows);
  } catch (err) {
    console.log("Dashboard Error", err);
    res.status(500).json(err.message);
  }
});

module.exports = router;
