root = @

Template = root.Template = {}

Backbone.setDomLibrary TiQuery

getValue = (object, prop) ->
  return null unless object?.prop?
  (if _.isFunction(object[prop]) then object[prop]() else object[prop])

eventSplitter = /^(\S+)\s*(.*)$/

Template.View = ->

class Template.View.Abstract extends Backbone.View

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

  get: (name) ->
    @elements[name] if _.has(@elements, name)

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

class Template.View.Window extends Template.View.Abstract
  render: ->
    $.Window(@options)

class Template.View.NaviGroup extends Template.View.Abstract
  render: () ->
    Ti.UI.iPhone.createNavigationGroup
      window: @view.render()

class Template.View.MainWindow extends Template.View.Window
  render: ->
    window = super()
    window.add @view.render()
    window.open()

class Template.View.ContainerWindow extends Template.View.Window
  render: ->
    window = super()
    window.add @view.render()
    window
