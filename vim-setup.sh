# #!/usr/bin/env bash

brew rm vim macvim python
brew install python
brew install vim --override-system-vi
brew install macvim --override-system-vim
sudo brew linkapps macvim
