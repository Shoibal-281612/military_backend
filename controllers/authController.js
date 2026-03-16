const pool = require("../config/db");
const jwt = require("jsonwebtoken");

exports.login = async (req, res) => {

try{

console.log("BODY:", req.body);

const { email, password } = req.body;

const result = await pool.query(
  "SELECT * FROM users WHERE email=$1",
  [email]
);

if(result.rows.length === 0){
  return res.status(401).json({ message:"Invalid credentials" });
}

const user = result.rows[0];

if(password !== user.password){
  return res.status(401).json({ message:"Invalid credentials" });
}

const token = jwt.sign(
  { id:user.id, role:user.role },
  "secret",
  { expiresIn:"1d" }
);

return res.json({ token });

}catch(err){

console.log(err);
return res.status(500).json("Server error");

}

};