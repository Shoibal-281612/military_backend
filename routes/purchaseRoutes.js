const router=require("express").Router();
const pool=require("../config/db");
const auth=require("../middleware/authmiddleware");

router.post("/",auth,async(req,res)=>{

try{

const {base_id,asset_id,quantity}=req.body;

const result=await pool.query(
"INSERT INTO purchases(base_id,asset_id,quantity) VALUES($1,$2,$3) RETURNING *",
[base_id,asset_id,quantity]
);

res.json(result.rows[0]);

}catch(err){

res.status(500).json(err.message)

}

});

router.get("/",auth,async(req,res)=>{

const result=await pool.query(`
SELECT p.id,b.base_name,a.name asset,p.quantity,p.purchase_date
FROM purchases p
JOIN bases b ON b.id=p.base_id
JOIN assets a ON a.id=p.asset_id
ORDER BY p.purchase_date DESC
`);

res.json(result.rows);

});

module.exports=router;