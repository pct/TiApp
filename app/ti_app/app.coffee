root = @

Tiapp = root.Tiapp =
  App: {}
  Model: {}
  View: {}
  Window: {}

class Tiapp.App
  run: ->
      #Tiapp.AppSync = new AppSync()
      main = new Tiapp.Window.Main().render()
      main.open()

