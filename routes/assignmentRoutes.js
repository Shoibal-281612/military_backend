const router = require("express").Router();
const pool = require("../config/db");
const auth = require("../middleware/authmiddleware");

router.get("/", auth, async (req, res) => {
  try {
    const result = await pool.query(`

SELECT
b.base_name,
a.name AS asset,

COALESCE(p.total_purchases,0) AS purchases,
COALESCE(ti.transfer_in,0) AS transfer_in,
COALESCE(to1.transfer_out,0) AS transfer_out,
COALESCE(asg.total_assignments,0) AS assignments,
COALESCE(exp.total_expended,0) AS expended

FROM bases b
CROSS JOIN assets a

LEFT JOIN (
SELECT base_id, asset_id, SUM(quantity) total_purchases
FROM purchases
GROUP BY base_id, asset_id
) p
ON p.base_id=b.id AND p.asset_id=a.id

LEFT JOIN (
SELECT to_base, asset_id, SUM(quantity) transfer_in
FROM transfers
GROUP BY to_base, asset_id
) ti
ON ti.to_base=b.id AND ti.asset_id=a.id

LEFT JOIN (
SELECT from_base, asset_id, SUM(quantity) transfer_out
FROM transfers
GROUP BY from_base, asset_id
) to1
ON to1.from_base=b.id AND to1.asset_id=a.id

LEFT JOIN (
SELECT base_id, asset_id, SUM(quantity) total_assignments
FROM assignments
GROUP BY base_id, asset_id
) asg
ON asg.base_id=b.id AND asg.asset_id=a.id

LEFT JOIN (
SELECT base_id, asset_id, SUM(quantity) total_expended
FROM expenditure
GROUP BY base_id, asset_id
) exp
ON exp.base_id=b.id AND exp.asset_id=a.id

`);

    res.json(result.rows);
  } catch (err) {
    res.status(500).json(err.message);
  }
});

module.exports = router;
