var cluster = require("../cluster-master.js");
cluster({exec:"./server.js", size:1, repl:4422, env:{}});