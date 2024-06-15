import express from 'express'
import connectDB from "./db/connectdb.js";
import web from './routes/web.js'
const app=express()
const port=process.env.PORT||"8000"
const DBURL=process.env.DATABASE_URL||"mongodb+srv://test:123@test.wc6ltk2.mongodb.net/hotel?retryWrites=true&w=majority&appName=Test"||"mongodb://localhost:27017";

connectDB(DBURL);

app.use(express.json())
app.use("/api",web)

app.listen(port,()=>{
    console.log('Server listening at ${port}');
})