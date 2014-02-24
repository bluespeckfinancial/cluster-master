###
  This file connects to a cluster-master repl and does the following:
   - Pulls in the latest files from git
   - Optionally runs brunch b
   - Sets the config for the worker processes
   - Restarts the worker processes

  On error, success or after a timeout of 60 seconds - the script will exit
###

config = process.env
{YWAZUREIP, YWAZUREPORT} = config

net = require("net")

socket = net.connect(+YWAZUREPORT, YWAZUREIP)

result = ""
count = 0
check = ->
  count += 1
  if /ERROR/.test(result)
    console.log result
    process.exit(1)
  else if /SUCESS/.test(result)
    console.log result
    process.exit()
  else if count > 60
    console.log "timed out"
    process.exit(1)

setInterval(check, 1000)

socket.on "data", (str) ->
  str = str.toString()
  console.log(str)
  result += str

socket.write "ywReload(#{JSON.stringify(config)})"