#!/usr/bin/env ruby
paths = `find app/ti_app -name '*.coffee'|grep -v run.coffee`.split("\n")

system "coffee -p --join --bare #{paths.join(' ')} app/ti_app/run.coffee > Resources/ti_app.js" and
system "coffee -p --bare app/app.coffee > Resources/app.js"

system "cd sync; coffee client.coffee"
