app = require("express").createServer()
io = require("socket.io").listen(app)
curr_data = {}
app_data = {}
app.listen 3000
app.get "/", (req, res) ->
    if app_data.length > 0 and app_data isnt curr_data
        res.send code: app_data, success: on
        curr_data = app_data
    else
        res.send success: off

io.sockets.on "connection", (socket) =>
  socket.on "sync", (data) =>
      app_data = data

