TiApp =
    App: {}
    Models: {}
    Helpers: {}
    Views:
        Main: {}

# Include your libraries like:
# Ti.include('vendor/date.js')
# Ti.include('vendor/underscore.js')
# Ti.include('vendor/backbone.js')

Ti.include('tiquery.js')
inc('ti_app.js')

TiApp.App.init()
