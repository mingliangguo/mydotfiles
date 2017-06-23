#!/usr/bin/env bash

# http://railsapps.github.io/installrubyonrails-mac.html
# get the latest stable rvm, it helps resolve some weird gem/bundler issues
curl -sSL https://get.rvm.io | bash -s stable
 \curl -L https://get.rvm.io | bash -s stable
rvm get stable --autolibs=enable

# rvm install 2.3.3
# rvm install 2.4.1
