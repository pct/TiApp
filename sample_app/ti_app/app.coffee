root = @

Tiapp = root.Tiapp =
  App: {}
  Model: {}
  View: {}
  Window: {}

FEED_URL = 'http://www.plurk.com/pctbot.xml'

class Tiapp.App
  run: ->
      Tiapp.AppSync = new AppSync()
      main = new Tiapp.Window.Main().render()
      main.open()

