# iOS trick
Ti.UI.createWindow
Ti.UI.createLabel
Ti.UI.createButton
Ti.UI.createView

TiApp.Views.Main.createMainWindow = (options) ->
    window  = new Window(options).setBackgroundColor '#1798cc'

    label = new Label
        text: 'Hello, world!'
        top: 100
        height: 150
        color: '#fff'
        font:
            fontSize: 50
        textAlign: 'center'

    button = new Button
        title: 'click me!'
        top: 250
        width: 100
        height: 50
        color: '#000'

    label4 = new Label
        text: 'Hello, 4Point Design Team!'
        top: 50
        height: 100
        color: '#1798cc'
        font:
            fontSize: 20
        textAlign: 'center'

    view = new View

    $(button).click =>
        label4.color = '#fff'

    view.add label
    view.add label4
    view.add button
    window.add view

    window
