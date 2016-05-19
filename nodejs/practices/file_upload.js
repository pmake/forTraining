var express = require('express');
var app = express();
var fs = require("fs");

var bodyParser = require('body-parser');
var multer  = require('multer');

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(multer({ dest: './tmp/'}).single('file'));

app.get('/file_upload.html', function (req, res) {
    res.sendFile( __dirname + "/" + "file_upload.html" );
})

app.post('/file_upload', function (req, res) {

    console.log(req.file);

    //multer在收到file_upload.html的上傳檔案需求後就已經處理上傳檔案並存放至指定位置
    //以下只是讀取上傳的檔案，並重新寫入另一個檔案
    var file = __dirname + "/" + req.file.originalname;
    fs.readFile( req.file.path, function (err, data) {
        fs.writeFile(file, data, function (err) {
            if( err ){
                console.log( err );
            }else{
                response = {
                    message:'File uploaded successfully',
                    filename:req.file.originalname
                };
            }
            console.log( response );
            res.end( JSON.stringify( response ) );
        });
    });
})

var server = app.listen(8081, function () {

    var host = server.address().address
    var port = server.address().port

    console.log("Example app listening at http://%s:%s", host, port)

})