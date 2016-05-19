var http = require('http');

http.request({host:'localhost', port:'8081', path:'/index.html'},function(response){
	var body='';
	response.on('data',function(data){
		body+=data;
	});
	response.on('end',function(){
		console.log(body);
	});
}).end();

