import mongoose from "mongoose";

const adminSchema=new mongoose.Schema({
    username:{type:String,required:true,trim:true,unique:true},
    password:{type:String,required:true,trim:true}
})

const AdminModel=mongoose.model("admin",adminSchema)

export default AdminModel