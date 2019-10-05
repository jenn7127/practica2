const controller={};

controller.list=(req,res)=>{
	const { id } = req.params;
	req.getConnection((err,conn)=>{
		conn.query('SELECT cita.codcita, cliente.nombre, date_format(horario.fecha,"%d %M %Y")as fecha, horario.hora_inicio, horario.hora_fin, cita.status, cita.doctor_coddoctor  FROM cita\
					INNER JOIN cliente ON cita.cliente_codcliente =cliente.codcliente\
					INNER JOIN horario ON cita.horario_codhorario = horario.codhorario \
					WHERE doctor_coddoctor=?;',[id], (err,citas)=> {
			if(err){
				res.json(err);
			}

			console.log(citas);
			res.render('citas',{
				data: citas
			})
		});
	});
};

controller.editStatus = (req, res) => {
  const { id } = req.params;
  console.log(id)
  req.getConnection((err, conn) => {
    conn.query('SELECT cita.codcita, cliente.nombre, date_format(horario.fecha,"%d %M %Y")as fecha, horario.hora_inicio, horario.hora_fin, cita.status, cita.doctor_coddoctor  FROM cita\
					INNER JOIN cliente ON cita.cliente_codcliente =cliente.codcliente\
					INNER JOIN horario ON cita.horario_codhorario = horario.codhorario \
					WHERE cita.codcita = ?;', [id], (err, citas) => {
					console.log(citas);
      res.render('citasStateUpdate', {
        data: citas[0]
      })
    });
  });
};


controller.updateStatus = (req, res) => {
  console.log("Son las update");
  const { id } = req.params;
  doc = req.params.doc;
   console.log("este es el doc ",doc);
  const newStatus = req.body;
  console.log("estdo",newStatus.status);
  req.getConnection((err, conn) => {
  
  conn.query('UPDATE cita set status=? where codcita = ?;', [newStatus.status, id], (err, rows) => {
   			 res.redirect('/'+ doc);
  });
  });
};


//video 1:06:04
// controller.saveDesc = (req, res)=>{
// 	const data = req.body;
// 	req.getConnection((err , conn)=>{
// 		conn.query('INSERT INTO resultados set ?',[data],(err,descripcion)=>{
// 			console.log(descripcion);
// 			       res.render('descripcion', {
//         data: descripcion
//       })
// 		});
// 	});
// };

controller.getDes = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT cita.codcita, cliente.nombre, date_format(horario.fecha,"%d %M %Y")as fecha, horario.hora_inicio, horario.hora_fin, cita.status, cita.doctor_coddoctor  FROM cita\
					INNER JOIN cliente ON cita.cliente_codcliente =cliente.codcliente\
					INNER JOIN horario ON cita.horario_codhorario = horario.codhorario \
					WHERE cita.codcita = 1;', (err, descripcion) => {
					console.log(descripcion);
      res.render('descripcion', {
        data: descripcion[0]
      })
    });
  });
};

module.exports = controller;

