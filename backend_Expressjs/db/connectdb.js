import mongoose from "mongoose";

const connectDB=async (DBURL)=>{
    try{
        const DB_OPTIONS={
            dbName:'hotel',
        }
        await mongoose.connect(DBURL,DB_OPTIONS);
        console.log('Connected successfully');
    }
    catch(err){
        console.log(err);
    }
}

export default connectDB