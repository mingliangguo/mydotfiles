# #!/usr/bin/env bash

brew rm vim macvim python
brew install python
brew install vim  --with-override-system-vi
brew install macvim --with-override-system-vi
sudo brew linkapps macvim
