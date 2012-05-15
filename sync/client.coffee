fs = require 'fs'
io = require 'socket.io-client'
socket = io.connect 'http://localhost:3000'
app_js = '../Resources/app.js'
ti_app_js = '../Resources/ti_app.js'

app_data = fs.readFileSync app_js, 'utf-8'
ti_app_data = fs.readFileSync ti_app_js, 'utf-8'

ret_data = "#{app_data} #{ti_app_data}".replace 'Tiapp.AppSync.sync();', ''

socket.on 'connect', ->
    socket.emit 'sync', ret_data
    socket.disconnect()
    console.log('sync')
