class Tiapp.Window.Main extends Template
  initialize: ->
    @main_window = $.Window
        backgroundColor: '#1798cc'

    @content_window = $.Window
        backgroundColor: '#1798cc'
        navBarHidden: off
        title: '正妹 RSS Reader'

    @nav_group = Tiapp.App.NavGroup = Ti.UI.iPhone.createNavigationGroup
        window: @content_window

    @table = $.TableView
        minRowHeight: 50

    @table_rows = []
    @fetch_and_render()
    @bind()

  fetch_and_render: ->
      $.http
        url: FEED_URL
        timeout: 5000
        onLoad: (data, http, event) =>
            try
                ret = ($.parse_xml data).feed.entry
                @render_table_rows ret
            catch error
                alert 'Feed 無法解析！'

        onError: (http, event) =>
            alert '載入 Feed 失敗！'

  render_table_rows: (data) ->
      _.each data, (item, num) =>
          bg_color = if num % 2 is 0 then '#fff' else '#eee'

          view = $.View
            width: 320
            height: 'auto'
            layout: 'vertical'

          webview = $.WebView
            width: 320
            height: 'auto'
            html: item.content['#text'].replace 'pctbot 說 ', ''
            backgroundColor: bg_color

          row = $.TableViewRow
            layout: 'vertical'
            height: 'auto'
            backgroundColor: bg_color

          view.add webview
          row.add view

          $(row).click =>
              detail_window = new Tiapp.Window.Detail(item).render()
              @nav_group.open detail_window

          @table_rows.push row

          # clean
          bg_color = null
          title = null
          view = null
          row = null

      @table.setData @table_rows

  bind: ->
      @main_window.addEventListener 'close', (e) =>
          @destroy()

  render: ->
      @content_window.add @table
      @main_window.add @nav_group

      @main_window

  destroy: ->
      @nav_group = null

      @main_window.close()
