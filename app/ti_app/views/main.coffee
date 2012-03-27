class MyApp.View.Main extends Template.View.Abstract

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

