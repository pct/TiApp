class MyApp.Window.Main extends Template

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
      title: 'click me!'
      top: 250
      width: 100
      height: 50
      color: '#000'


    @bind()

  bind: ->
      $(@button).click =>
          @open_second_window()

  render: ->
      @content_window.add @label1
      @content_window.add @button

      @main_window.add @nav_group

      @main_window

  open_second_window: ->
      @nav_group.open new MyApp.Window.Second().render()

  destroy: ->

