import express from 'express';
import RoomController from '../controllers/roomcontroller.js';
import RoomModel from '../models/room.js';
import UserModel from '../models/user.js';
import AdminModel from '../models/admin.js';
const router=express.Router();

router.get('/rooms',RoomController.getAllDoc)

router.get('/rooms/:username',async (req,res)=>{
    try{
        const result=await RoomModel.find({username:new String(req.params.username)})
        res.send(result)
    }catch(error){
        console.log(error)
    }
})

router.post('/rooms', async (req, res)=>{
    try{
        const newroom=new RoomModel(req.body);
        await newroom.save()
        .then((savedroom)=>console.log(savedroom));
    }
    catch(error){
        console.log(error);
    }
})

router.get('/users', async(req,res)=>{
    try{
        const result=await UserModel.find()
        res.send(result)
    }
    catch(error){
        console.log(error)
    }
})

router.get('/users/:username',async (req,res)=>{
    try{
        const result=await UserModel.findOne({username:new String(req.params.username)})
        res.send(result)
    }catch(error){
        console.log(error)
    }
})

router.post('/users', async (req, res)=>{
    try{
        const newUser=new UserModel(req.body);
        await newUser.save()
        .then((saveduser)=>console.log(saveduser));
    }
    catch(error){
        console.log(error);
    }
})

router.get('/admins/:username',async (req,res)=>{
    try{
        const result=await AdminModel.findOne({username:new String(req.params.username)})
        console.log(result)
        res.send(result)
    }catch(error){
        console.log(error)
    }
})

router.get('/admins', async(req,res)=>{
    try{
        const result=await AdminModel.find()
        res.send(result)
    }
    catch(error){
        console.log(error)
    }
})

router.post('/admins', async (req, res)=>{
    try{
        const newAdmin=new AdminModel(req.body);
        await newAdmin.save()
        .then((saveduser)=>console.log(saveduser));
    }
    catch(error){
        console.log(error);
    }
})

export default router