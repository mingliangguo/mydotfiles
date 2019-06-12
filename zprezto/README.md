# Install zprezto


1. make sure `zsh` is installed

2. clone prezto repo
 
```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

3.  run the following init script, which basically creates symbolic links

```bash
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

4. Use `.zpreztorc` to replace the default file

*Note* might be helpful to do a compare and merge with upstream changes. All the original source code can be found in `.zprezto` folder.
