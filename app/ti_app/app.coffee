root = @

Tiapp = root.Tiapp =
  App: {}
  Model: {}
  View: {}
  Window: {}

class Tiapp.App
  run: ->
      main = new Tiapp.Window.Main().render()
      main.open()

