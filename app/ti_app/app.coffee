Tiapp.App =

  currentUser: ->
    userData = Ti.App.Properties.getString('user')
    if userData?
      user = JSON.parse(userData)
      return user
    else
      null

  # Attempt to log in with saved credentials
  hasCurrentSession: ->
    login     = Ti.App.Properties.getString 'login'
    password  = Ti.App.Properties.getString 'password'
    if login? and password?
      Ti.API.debug "Found current session with login: #{login} and password: #{password}"
      this.api = new Tiapp.API(login, password)
    else
      Ti.API.debug "No current session found", login, password
    login? and password?

  getCurrentLocation: (options) ->
    options.success  ?= ->
    options.error    ?= ->
    Ti.Geolocation.purpose = "Find something near you"
    Ti.Geolocation.accuracy = Ti.Geolocation.ACCURACY_KILOMETER
    Ti.Geolocation.getCurrentPosition (e) ->
      if !e.success || e.error
        Ti.API.error e.error
        options.error e.error
      options.success e.coords if e.success
      
  
  # Authenticate a user
  authenticate: (login, password) ->
    Ti.API.debug('Tiapp.App.authenticate')
    @api = new Tiapp.API(login, password)
    @api.authenticate
      success: (user) ->
        Ti.App.Properties.setString('user', JSON.stringify(user))
        Ti.App.Properties.setString('login', login)
        Ti.App.Properties.setString('password', password)
        Ti.App.fireEvent 'login:success', user.username
      error: (e) ->
        Ti.API.error(e)

  # Registers a new user
  register: (options) ->
    api = new Tiapp.API
    api.register options
  
  signOut: ->
    Ti.App.Properties.removeProperty 'user'
    Ti.App.Properties.removeProperty 'login'
    Ti.App.Properties.removeProperty 'password'
    Ti.App.fireEvent 'logout'

  init: ->
    Ti.UI.setBackgroundColor '#000'
    Ti.UI.iPhone.statusBarStyle = Ti.UI.iPhone.StatusBar.OPAQUE_BLACK

    showLogin = () ->
      rootWindow  = Ti.UI.createWindow()
      login       = Tiapp.Views.Account.createLoginWindow
        title:  'Login'
        id:     'loginWindow'
      Tiapp.App.sessionNavGroup = Ti.UI.iPhone.createNavigationGroup
        window: login
      rootWindow.add Tiapp.App.sessionNavGroup
      Ti.App.addEventListener 'login:success', (e) ->
        rootWindow.close()
      rootWindow.open()
      
    loggedIn = Tiapp.App.hasCurrentSession()

    if loggedIn
      Tiapp.App.initTabGroup()
    else
      showLogin() unless loggedIn

    # Listen to an app-wide `logout` event and show the login again
    Ti.App.addEventListener 'logout', (e) ->
      showLogin()

    Ti.App.addEventListener 'login:success', (e) ->
      Tiapp.App.initTabGroup()

  initTabGroup: ->
    Tiapp.App.tabGroup = Ti.UI.createTabGroup()

    # Sample Tab
    sampleWindow = Tiapp.Views.Sample.createMainWindow
      title:            'Sample'
      id:               'sampleWindow'
      orientationModes: Tiapp.Helpers.Application.createOrientiationModes
    Tiapp.App.sampleWindow = Ti.UI.createTab
      id:               'sampleTab'
      className:        'tabElement'
      title:            'Sample'
      window:           sampleWindow
    
    
    # Bottom Tab Loader
    Tiapp.App.tabGroup.addTab Tiapp.App.sampleWindow
    
    Tiapp.App.tabGroup.addEventListener 'focus', (e) ->
      Tiapp.App.currentTab = e.tab
      Ti.API.info(Tiapp.App.currentTab)
    
    # Open Tabs
    Tiapp.App.tabGroup.open()