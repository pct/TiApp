TiApp
======

My simple iOS app template create from Ti and tiquery.js

Usage and Hello, world
-----------------------
Steps::

    1. git clone git://github.com/pct/TiApp.git MyApp
    2. cd MyApp
    3. ./init.py # to generate app guid
    4. rake


Please modify tiapp.xml and config/config.rb for your own settings.

Requirements
------------

Ruby and rubygems::

    $ gem install nokogiri colored betabuilder

or use Bundler::

    $ bundle

Notice
------

This project use tiquery.js, and it needs some tricks when you build demo and distribute to your iOS device.

When you use `$.Window()` or `$.Label()` or other Ti.UI modules, you must add this::

    # iOS trick
    Ti.UI.createWindow
    Ti.UI.createView
    Ti.UI.createLabel
    Ti.UI.createButton
    Ti.UI.create...

Then when Titanium optimize your build, it won't clean out all UI modules you just need.
