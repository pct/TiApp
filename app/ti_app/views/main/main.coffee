$.Views.Main.createMainWindow = (options) ->
  window  = new Window(options).setBackgroundColor '#1798cc'

  label = new Label
      id: 'main-label'
      text: 'Hello, world!'
      color: '#fff'
      fontSize: 40
      textAlign: 'center'

  view = new View()

  view.add label
  window.add view

  window
