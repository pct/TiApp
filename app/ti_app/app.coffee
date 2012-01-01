$.App =
  init: ->
    $.App.initMainWindow()

  initMainWindow: ->
    main = new Window

    nav = Ti.UI.iPhone.createNavigationGroup
        window: $.Views.Main.createMainWindow
            title: 'Main'

    main.add nav

    main.open()
