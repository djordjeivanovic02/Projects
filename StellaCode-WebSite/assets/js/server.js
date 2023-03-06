var http = require('http');
var fs = require('fs');

function onRequest(request, response) {
    response.writeHead(200, {'Content-Type': 'text/html'});
    fs.readFile('../../index.html', null, function(error, data){
      if(error){
        response.writeHead(404);
        response.write("File not Found");
      }
      else{
        response.write(data);
      }
      response.end();
    })
}

http.createServer(onRequest).listen(8000);

var express=require("express");
var bodyParser=require("body-parser");

var app=express();

// Process application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({extended: true}))

// Process application/json
app.use(bodyParser.json());

app.post('/createEmp', function(req, res){  
//now req.body will be populated with the object you sent
console.log(req.body.name); //prints john
});