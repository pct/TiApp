TiApp.App =
    init: ->
        TiApp.App.initMainWindow()

    initMainWindow: ->
        main = new Window

        nav = Ti.UI.iPhone.createNavigationGroup
            window: TiApp.Views.Main.createMainWindow
                title: 'Main'

        main.add nav

        main.open()
