$.App =
  init: ->
    $.App.initTabGroup()

  initTabGroup: ->
    $.App.tabGroup = new TabGroup()

    # Main Tab
    mainWindow = $.Views.Main.createMainWindow
      title:            'Main'
      id:               'mainWindow'
      orientationModes: $.Helpers.Application.createOrientiationModes
    $.App.mainWindow = new Tab
      id:               'mainTab'
      className:        'tabElement'
      title:            'Main'
      window:           mainWindow
    
    # Bottom Tab Loader
    $.App.tabGroup.addTab $.App.mainWindow
    
    $.App.tabGroup.addEventListener 'focus', (e) ->
      $.App.currentTab = e.tab
      info($.App.currentTab)
    
    # Open Tabs
    $.App.tabGroup.open()
