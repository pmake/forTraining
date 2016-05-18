function compress(){
    var fs = require('fs');
    var zlib = require('zlib');
    fs.createReadStream('input.txt').pipe(zlib.createGzip()).pipe(fs.createWriteStream('input.txt.gz'));

    console.log('Compress completed');
}

function decompress(){
    var fs = require('fs');
    var zlib = require('zlib');
    fs.createReadStream('input.txt.gz').pipe(zlib.createGunzip()).pipe(fs.createWriteStream('input.txt'));

    console.log('Decompress completed');
}

compress();
//decompress();