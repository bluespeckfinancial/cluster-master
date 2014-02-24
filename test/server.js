console.log("server started");
console.log(JSON.stringify(process.env, null, 4));

var net = require("net")
net.createServer(function(){}).listen(1231)
