# Installation #
Be sure you're using an administrator account before you run this script. If necessary, use `su <admin username>`.

```
curl https://raw.github.com/derekhouck/dotfiles/master/install.sh -L -o - | sh
```
## What this does ##

1. Asks for admin password
2. Updates all existing software
3. Installs XCode
4. Installs Homebrew if not already installed then runs `brew doctor` and `brew update`
5. Installs MacVim

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions