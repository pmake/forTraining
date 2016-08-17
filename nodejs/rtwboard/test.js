var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/test');

var db = mongoose.connection;

db.on('error', console.error.bind(console, 'connection error:'));

db.once('open', function(){
    console.log('db connected');
});

var countersSchema = mongoose.Schema({
    _id: String,
    seq: Number
});

var Counter = mongoose.model('Counter', countersSchema);
//
//var counter = new Counter({_id: 'answerSquence', seq: 0});


var testSchema = mongoose.Schema({
    _id: Number,
    name: String
});

var Test = mongoose.model('Test', testSchema);

var test = new Test({name: 'lol'});

saveBySquence('answerSquence', test);

Test.find((err, data)=>{
    console.log(data);
});

function saveBySquence(squenceName, doc) {
    Counter.findOneAndUpdate(

        { _id: squenceName },
        { $inc: { seq: 1 } },
        {new: true},
        (err, result)=>{
            doc._id = result.seq;
            doc.save();
        }
    );
}


