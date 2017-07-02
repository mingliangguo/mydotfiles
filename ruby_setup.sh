#!/usr/bin/env bash

# http://railsapps.github.io/installrubyonrails-mac.html
# get the latest stable rvm, it helps resolve some weird gem/bundler issues
#curl -sSL https://get.rvm.io | bash -s stable
 \curl -L https://get.rvm.io | bash -s stable
rvm get stable --autolibs=enable

# After GPG is installed (or if it is already installed), install the security key for RVM:
# Ruby related
# check http://www.ruby-lang.org/en/downloads/ to get the recommended version

command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
# there are issues with ruby-2.4.1 for jekyll , so use 2.3.3
rvm install ruby-2.3.3
# brew install rbenv ruby-build rbenv-default-gems rbenv-gemset
gem update

# rvm install 2.3.3
# rvm install 2.4.1

# install jekyll
gem install jekyll bundler
gem install jekyll-paginate
gem install jekyll-gist


