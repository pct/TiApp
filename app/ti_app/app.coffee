root = @

MyApp = root.MyApp =
  app: null,
  App: {}
  Model: {}
  View: {}
  Window: {}

class MyApp.App
  run: ->
      main = new MyApp.Window.Main().render()
      main.open()

