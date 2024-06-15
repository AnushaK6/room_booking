import RoomModel from "../models/room.js";

class RoomController{
    static getAllDoc=async(req,res)=>{
        try{
            const result=await RoomModel.find()
            res.send(result)
        }
        catch(error){
            console.log(error)
        }
    }
}

export default RoomController