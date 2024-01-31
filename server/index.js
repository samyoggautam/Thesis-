// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
require('dotenv').config()

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

// INIT
const PORT = process.env.PORT || 3000;
const app = express();

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

const MONGODB_URI = process.env.NODE_ENV === 'test'
  ? process.env.TEST_DB_URI
  : process.env.DB_URI

// Connections
mongoose.connect(MONGODB_URI)
  .then(() => {
    console.log(`connected to ${MONGODB_URI}`)
  })
  .catch((err) => console.log(err))

app.get('/', (req, res) => {
  res.send("Api working")
})
app.listen(PORT, () => {
  console.log(`Server running at port ${PORT}`)
})
