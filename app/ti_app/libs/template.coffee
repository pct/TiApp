Backbone.setDomLibrary TiQuery

class Template extends Backbone.View
    constructor: (options) ->
        @_configure options || {}
        @initialize.apply @, arguments
        @delegateEvents()

    delegateEvents: ->
