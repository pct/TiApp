root = @

MyApp = root.MyApp =
  app: null,
  App: {}
  Model: {}
  View: {}

class MyApp.App
  run: ->
    mainView = new Template.View.MainWindow()
    naviView = mainView.wrapper new Template.View.NaviGroup()
    contView = naviView.wrapper new Template.View.ContainerWindow
      title: 'Test'
      backgroundColor: '#1798cc'
    contView.wrapper new MyApp.View.Main()

    mainView.render()

