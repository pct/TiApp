class Tiapp.Window.Detail extends Template
  constructor: (@item) ->
      super

  initialize: ->

    @window = $.Window
        backgroundColor: '#333'
        title: @item.title['#text'].replace 'pctbot 說 ', ''
        backButtonTitle: '返回'

    @webview = $.WebView
        width: '100%'
        height: '100%'
        url: @item.content['#text'].match(/http:\/\/[^\s]+/, "$1")[0].replace '"', ''

    @bind()

  bind: ->
      @window.addEventListener 'close', (e) =>
          @destroy()

  render: ->
      @window.add @webview
      @window

  destroy: ->
      @window.close()

