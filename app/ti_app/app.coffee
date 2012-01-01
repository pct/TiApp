$.App =
  init: ->
    $.App.initTabGroup()

  initTabGroup: ->
    $.App.tabGroup = new TabGroup()

    mainWindow = $.Views.Main.createMainWindow
      title: 'Main'

    $.App.mainWindow = new Tab
      className: 'tabElement'
      title: 'Main'
      window: mainWindow
    
    $.App.tabGroup.addTab $.App.mainWindow
    
    $.App.tabGroup.open()
