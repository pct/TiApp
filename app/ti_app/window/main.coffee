class Tiapp.Window.Main extends Template

  initialize: ->
    @main_window = $.Window
        backgroundColor: '#1798cc'

    @content_window = $.Window
        backgroundColor: '#1798cc'
        navBarHidden: off
        title: 'Main Window'

    @nav_group = Ti.UI.iPhone.createNavigationGroup
        window: @content_window

    @label1 = $.Label
      text: '4Point Design'
      top: 100
      height: 150
      color: '#fff'
      font:
        fontSize: 50
      textAlign: 'center'

    @button= $.Button
      title: 'click to show window2'
      top: 250
      width: 200
      height: 50
      color: '#000'


    @bind()

  open_second_window: ->
      @nav_group.open new Tiapp.Window.Second().render()

  bind: ->
      $(@button).click =>
          @open_second_window()

      @main_window.addEventListener 'close', (e) =>
          @destroy()

  render: ->
      @content_window.add @label1
      @content_window.add @button

      @main_window.add @nav_group

      @main_window

  destroy: ->
      @label1 = null
      @button = null
      @nav_group = null

      @main_window.close()
