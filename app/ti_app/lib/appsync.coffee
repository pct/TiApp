class AppSync
  constructor: (@ip = 'localhost', @port = 3000) ->

  sync: ->
    xhr = Ti.Network.createHTTPClient()
    xhr.setTimeout 40000
    xhr.onload = ->
      xhr.abort()
      result = JSON.parse(@responseText)
      @onerror()  unless result
      #Ti.API.info @responseText
      try
        if result.success
          current.close()  if current and current.close isnt `undefined`
          current = eval(result.code)
          current.open()  if current and current.open isnt `undefined`
          Ti.API.info "Deployed"
        @sync()
      catch e
        error_message = undefined
        if e.line is `undefined`
          error_message = e.toString()
        else
          error_message = "Line " + e.line + ": " + e.message
        Ti.API.debug error_message

    xhr.onerror = ->
      alert "HttpRequest ERROR, Please check if server started!"
      current.close()  if current and current.close isnt `undefined`

    xhr.open "GET", "http://#{@ip}:#{@port}"
    xhr.send()
