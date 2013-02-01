#!/bin/sh

# gen uuid
python ./gen_uuid.py

# clean files
rm -rf gen_uuid.py
rm -rf sample_app
rm -rf README.rst
rm -rf intro.rst
rm -rf sync
rm -rf app/ti_app/lib/appsync.coffee
rm -rf run.rb
rm -rf .git
rm -rf init.sh

# git init
git init
git add .
git ci -m 'init'
