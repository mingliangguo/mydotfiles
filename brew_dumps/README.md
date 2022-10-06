# README

## To dump all of the brew packages installed in a box

```bash
brew bundle dump
mv Brewfile ~/Dropbox/brew_backup
```

This will create a file named as 'Brewfile', which contains all of the packages installed in the current box.


## To restore the packages in a different box

```bash
cd ~/Dropbox/brew_backup
brew bundle
```
