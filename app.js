const express = require('express');
const dbconnect = require('./confing');
const modeluser = require('./userModel');

const app = express();

const router = express.Router();
router.post("/", async (req,res)=>{
    const body = req.body;
    const respuesta = await modeluser.create(body)
    res.send(respuesta)
})

router.get("/",async(req,res) => {
    const respuesta = await modeluser.find({})
    res.send(respuesta);
})

router.get("/:id", async (req, res) => {
    const id = req.params.id;
    const respuesta = await modeluser.findById(id)
    res.send(respuesta) ;
})

router.put("/:id", async (req, res) => {
    const body = req.body;
    const id = req.params.id;
    const respuesta = await modeluser.findOneAndUpdate({_id: id },body)
    res.send(respuesta) ;
})

router.delete("/:id", async (req, res) => {
    const id = req.params.id;
    const respuesta = await modeluser.deleteOne({_id: id })
    res.send(respuesta) ;
})

app.use(express.json());
app.use(router)
app.listen(3001, () => {
console.log("El servidor esta en el puerto 3001")
})


dbconnect();

