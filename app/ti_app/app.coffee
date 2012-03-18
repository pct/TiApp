MyApp =
  app: null,
  App: {}
  Model: {}
  View: {}

Backbone.setDomLibrary TiQuery

getValue = (object, prop) ->
  return null unless object?.prop?
  (if _.isFunction(object[prop]) then object[prop]() else object[prop])

eventSplitter = /^(\S+)\s*(.*)$/

class MyApp.View.Abstract extends Backbone.View

  view: null

  elements: {}

  eventListeners: {}

  constructor: (options) ->
    @cid = _.uniqueId 'view'
    @_configure options || {}
    @initialize.apply @, arguments
    @delegateEvents()

  wrapper: (view) ->
    @view = view

  add: (name, el) ->
    @elements[name] = el

  destroy: ->
    delete @view

  render: ->
    view = $.View()
    for name, el of @elements
      view.add el
    view

  delegateEvents: (events) ->
    return unless events or (events = @events)
    @undelegateEvents()
    for key of events
      method = events[key]
      method = @[events[key]] unless _.isFunction(method)
      throw new Error("Event \"" + events[key] + "\" does not exist") unless method
      match = key.match(eventSplitter)
      eventName = match[1]
      selector = match[2]
      method = _.bind(method, @)
      el = if _.has(@elements, selector) then @elements[selector] else null
      if el
        $(el).bind(eventName, method)
        @eventListeners[selector] = {} unless _.has(@eventListeners, selector)
        @eventListeners[selector][events] = method

  undelegateEvents: ->
    for name, events of @eventListeners
      el = @elements[name]
      for event, method of events
        $(el).unbind event, method

class MyApp.View.Window extends MyApp.View.Abstract
  render: ->
    $.Window(@options)

class MyApp.View.NaviGroup extends MyApp.View.Abstract
  render: () ->
    Ti.UI.iPhone.createNavigationGroup
      window: @view.render()

class MyApp.View.MainWindow extends MyApp.View.Window
  render: ->
    window = super()
    window.add @view.render()
    window.open()

class MyApp.View.ContainerWindow extends MyApp.View.Window
  render: ->
    window = super()
    window.add @view.render()
    window

class MyApp.View.Hello extends MyApp.View.Abstract

  events:
    'click button': 'changeColor'

  initialize: ->
    label1 = $.Label
      text: 'Hello, world!'
      top: 100
      height: 150
      color: '#fff'
      font:
        fontSize: 50
      textAlign: 'center'

    button = $.Button
      title: 'click me!'
      top: 250
      width: 100
      height: 50
      color: '#000'

    label2 = $.Label
      text: 'Hello, 4Point Design Team!'
      top: 50
      height: 100
      color: '#1798cc'
      font:
        fontSize: 20
      textAlign: 'center'

    @add 'button', button
    @add 'label1', label1
    @add 'label2', label2

  changeColor: ->
    info @elements['label2']
    @elements['label2'].color = '#fff'

class MyApp.App
  run: ->
    mainView = new MyApp.View.MainWindow()
    naviView = mainView.wrapper new MyApp.View.NaviGroup()
    contView = naviView.wrapper new MyApp.View.ContainerWindow
      title: 'Test'
      backgroundColor: '#1798cc'
    contView.wrapper new MyApp.View.Hello()

    mainView.render()

MyApp.app = new MyApp.App()
MyApp.app.run()