#!/bin/sh
coffee -p --bare app/ti_app/app.coffee app/ti_app/device_fix.coffee app/ti_app/lib/appsync.coffee app/ti_app/lib/template.coffee app/ti_app/window/main.coffee app/ti_app/window/second.coffee app/ti_app/run.coffee > Resources/ti_app.js

cd sync
coffee client.coffee
