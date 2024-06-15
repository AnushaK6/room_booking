import mongoose from "mongoose";

const roomSchema=new mongoose.Schema({
    name:{type:String,required:true,trim:true},
    size:{type:String,required:true,trim:true},
    club:{type:String,required:true,trim:true},
    purpose:{type:String,required:true,trim:true},
    num:{type:Number,required:true,trim:true},
    from:{type:String,required:true,trim:true},
    to:{type:String,required:true,trim:true},
    username:{type:String,required:true,trim:true},
})

const RoomModel=mongoose.model("room",roomSchema)

export default RoomModel