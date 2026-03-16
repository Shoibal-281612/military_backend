const router=require("express").Router();
const pool=require("../config/db");
const auth=require("../middleware/authmiddleware");

router.post("/",auth,async(req,res)=>{

const {asset_id,from_base,to_base,quantity}=req.body;

const result=await pool.query(
"INSERT INTO transfers(asset_id,from_base,to_base,quantity) VALUES($1,$2,$3,$4) RETURNING *",
[asset_id,from_base,to_base,quantity]
);

res.json(result.rows[0]);

});

router.get("/",auth,async(req,res)=>{

const result=await pool.query(`
SELECT t.id,a.name asset,
b1.base_name from_base,
b2.base_name to_base,
t.quantity,
t.transfer_date
FROM transfers t
JOIN assets a ON a.id=t.asset_id
JOIN bases b1 ON b1.id=t.from_base
JOIN bases b2 ON b2.id=t.to_base
ORDER BY t.transfer_date DESC
`);

res.json(result.rows);

});

module.exports=router;