const assert = require("assert");
const request = require("supertest");
const app= require("../src/app");


describe("Getting the date",() =>{
	it("Handles GET request /:doc/update/:id",  function(done){
		request(app).get('/1/update/1')
		.expect(200,done)
	});
});


describe("Getting all dates",() =>{
	it("Handles GET request /:doc",  function(done){
		request(app).get('/1')
		.expect(200,done)
	});
});


describe ("update status",function(){
    it("updates the status", function(done){
        request(app).post('/1/update/1')
        .send({status:1})
        .expect(302)
        .expect('Found. Redirecting to /1',done)
    })
})



// describe('/GET cita ', () => {
//     it('it should Get cita  users', (done) => {
//         request(app)
//         .get('/1/update/1')
//         .end((err, res) => {
//             res.should.have.status(200);
//             res.body.should.be.a('object');
//             done();
//         });
//     });
// });