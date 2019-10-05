const express = require('express');
const router = express.Router();//generador de rutas

const citasController = require('../controllers/citasController');

router.get('/:id',citasController.list);

router.get('/:doc/update/:id', citasController.editStatus);
router.post('/:doc/update/:id', citasController.updateStatus);

router.get('/addDesc',citasController.getDes);
//router.post('/addDesc',citasController.saveDesc)

module.exports = router;