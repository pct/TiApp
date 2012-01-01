# This file is the entry point for the application. It sets up the four main
# tab windows.
# The `Tiapp` object provides common access to app data, API wrapper and UI utilities

# ## Tiapp ##
Tiapp =
  Models:   {}
  Helpers:  {}
  Views:
    Main: {}    {}

# Include your libraries like:
# Ti.include('vendor/date.js')
# Ti.include('vendor/underscore.js')
# Ti.include('vendor/backbone.js')

Ti.include('ti_app.js')

# Alias, so you could do $.App.init() below. If you have an API class, 
# make sure to either use the full app name or declare the below at the top
# and use $.API for the class name. Uncomment to use.
# $ = Tiapp

Tiapp.App.init()