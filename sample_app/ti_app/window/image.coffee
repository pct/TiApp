class Tiapp.Window.Image extends Template

  initialize: ->
    @bind()

  bind: ->
      @window.addEventListener 'close', (e) =>
          @destroy()

  render: ->
      @window

  destroy: ->
      @window.close()

