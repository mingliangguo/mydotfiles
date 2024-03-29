# README

This is my personal configuration of dot files. 

When setup a new MacOS environment. Follow the following steps:

1. run `install.sh`
2. run `mac_setup.sh` to configure the default macOS settings
3. run `brewcask.sh` to install all of the utilities and applications
4. follow the guide in `zprezto/README.md` about how to setup zsh
5. Install squirrel input:
	- [Install and configure Squirrel](https://www.dreamxu.com/install-config-squirrel/)

## Fonts I love

- [Twilio Sans Mono](https://github.com/twilio/twilio-sans-mono)
- [Fantasque Sans Mono](https://github.com/belluzj/fantasque-sans)
- [Fira Code](https://github.com/tonsky/FiraCod)

This [website](https://www.programmingfonts.org/) has a good collection of popular programming fonts.


## Use chezmoi for dotfiles management

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

## Use asdf for tools version management

`asdf` is a similar tool like `rbenv`, `pyenv`, but in a universal way.

- [asdf](https://asdf-vm.com/guide/getting-started.html)

## Enable TouchID for sudo in MacOS

- [Use TouchID to Authenticate sudo on macOS](https://it.digitaino.com/use-touchid-to-authenticate-sudo-on-macos/)
- [Enable touchId in tmux](https://github.com/fabianishere/pam_reattach)

- TLDR

```bash
# install pam-reattach for touch id in tmux
brew install pam-reattach

# add the following lines into /etc/pam.d/sudo
auth     optional     /opt/homebrew/lib/pam/pam_reattach.so
auth     sufficient   pam_tid.so
```

## configure ssh

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed2551
```

## Configure quake style terminal

### For kitty

- [Quake Applications For Mac](https://lukesmurray.com/blog/quake-applications-for-mac)

## Multiple versions of MacOS

- [Use more than one version of macOS on a Mac](https://support.apple.com/en-us/HT208891)


## Development related configurations

### Python

To configure the poetry environment, make sure the correct python version is used. For example, if a python project requires a specific python version, use the following command to configure it:

```bash
poety  env use 3.9.18
```

## Terminal configuration

- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [Powerlevel9k](https://github.com/bhilburn/powerlevel9k)
- [Awesome terminal fonts](https://github.com/gabrielelana/awesome-terminal-fonts)
- [powerline-status](https://pypi.python.org/pypi/powerline-status)
- [powerline-fonts](https://github.com/powerline/fonts)
- [nerd fonts](https://github.com/ryanoasis/nerd-fonts)
- [differentiate git personal and work emails](https://blog.hao.dev/how-to-use-different-git-emails-for-personal-and-work-repositories-on-the-same-machine)

