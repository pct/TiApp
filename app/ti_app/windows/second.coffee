class MyApp.Window.Second extends Template

  initialize: ->

    @label1 = $.Label
      text: 'Hello, world!'
      top: 100
      height: 150
      color: '#fff'
      font:
        fontSize: 50
      textAlign: 'center'

    @label2= $.Label
      text: 'This is the Second Window'
      top: 50
      height: 100
      color: '#1798cc'
      font:
        fontSize: 20
      textAlign: 'center'

    @button= $.Button
      title: 'say hello!'
      top: 250
      width: 100
      height: 50
      color: '#000'

    @window = $.Window
        backgroundColor: '#333'
        title: 'Second Window'
        backButtonTitle: 'Back'

    @bind()

  bind: ->
      $(@button).click (e) ->
          alert 'hello!'

  render: ->
      @window.add @label1
      @window.add @label2
      @window.add @button

      @window

  destroy: ->

