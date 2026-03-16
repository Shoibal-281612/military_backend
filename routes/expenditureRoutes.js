const router=require("express").Router();
const pool=require("../config/db");
const auth=require("../middleware/authmiddleware");
const role=require("../middleware/rolemiddleware");

router.post("/",auth,role("Admin","Commander"),async(req,res)=>{

const {asset_id,base_id,quantity,expended_date,notes}=req.body;

const result=await pool.query(
`INSERT INTO expenditures(asset_id,base_id,quantity,expended_date,notes,created_by)
VALUES($1,$2,$3,$4,$5,$6)
RETURNING *`,
[asset_id,base_id,quantity,expended_date,notes,req.user.id]
);

res.json(result.rows[0]);

});

router.get("/",auth,async(req,res)=>{

const result=await pool.query(`
SELECT e.id,a.name,b.base_name,e.quantity,e.expended_date,e.notes
FROM expenditures e
JOIN assets a ON e.asset_id=a.id
JOIN bases b ON e.base_id=b.id
`);

res.json(result.rows);

});

module.exports=router;