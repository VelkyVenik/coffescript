square = (x) -> x * x
cube = (x) -> square(x) * x


fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."


a = 116

console.log fill square cube a if a > 10

#
# http = require 'http'
#
# http.createServer (req, res) ->
#   res.writeHead 200, {'Content-Type': 'text/plain'}
#   res.end 'Hello World\n'
# .listen 1337, '127.0.0.1'
#
# console.log 'Server running at http://127.0.0.1:1337/'
