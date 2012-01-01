$.Views.Main.createMainWindow = (options) ->
  window  = new Window(options).setBackgroundColor '#1798cc'

  label = new Label
      text: 'Hello, world!'
      color: '#fff'
      font:
        fontSize: 50
      textAlign: 'center'

  view = new View

  view.add label
  window.add view

  window
