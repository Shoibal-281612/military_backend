require("dotenv").config();
const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors(
  {
   origin: [
    "https://militaryasset-managementsystem-icvw8tubf-shoibals-projects.vercel.app",
    "http://localhost:3000" // Or whatever port your frontend runs on locally
  ],
  credentials: true
  }
));
app.use(express.json());

app.use("/auth", require("./routes/authRoutes"));
app.use("/purchase", require("./routes/purchaseRoutes"));
app.use("/transfer", require("./routes/transferRoutes"));
app.use("/assignments", require("./routes/assignmentRoutes"));
app.use("/expenditure", require("./routes/expenditureRoutes"));
app.use("/dashboard", require("./routes/dashboardRoutes"));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});