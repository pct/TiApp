root = @

MyApp = root.MyApp =
  app: null,
  App: {}
  Model: {}
  View: {}

class MyApp.View.Hello extends Template.View.Abstract

  events:
    'click button': 'changeColor'

  initialize: ->

    @add 'label1', $.Label
      text: 'Hello, world!'
      top: 100
      height: 150
      color: '#fff'
      font:
        fontSize: 50
      textAlign: 'center'

    @add 'label2', $.Label
      text: 'Hello, 4Point Design Team!'
      top: 50
      height: 100
      color: '#1798cc'
      font:
        fontSize: 20
      textAlign: 'center'

    @add 'button', $.Button
      title: 'click me!'
      top: 250
      width: 100
      height: 50
      color: '#000'

  changeColor: ->
    @get('label2').color = '#fff'

class MyApp.App
  run: ->
    mainView = new Template.View.MainWindow()
    naviView = mainView.wrapper new Template.View.NaviGroup()
    contView = naviView.wrapper new Template.View.ContainerWindow
      title: 'Test'
      backgroundColor: '#1798cc'
    contView.wrapper new MyApp.View.Hello()

    mainView.render()

MyApp.app = new MyApp.App()
MyApp.app.run()
