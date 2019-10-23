# .dotfile — My personal dotfile environments

[![Build Status](https://travis-ci.com/socheatsok78/.dotfile.svg?branch=master)][travis-ci-status]

### :warning: Use at your own risk
**You should only use this on a fresh installed system!**
This is a personal `dotfile` environment, ***I intend to use for my own system***, but if you insist to use the same environment as I do, please know that you're on your own.

I'm **not responsible** for any damage done to your **system\computer**. Please review the source code before using. You could check the **[Travis Build Status][travis-ci-status]** for more information.

But if you enjoy it please give it a star :star:!

## Installation
To automatically install `dotfile` on your system, simply run the following command:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/socheatsok78/.dotfile/master/install)"
```

After the installation completed, add the following line to your `.bashrc` or `.zshrc` file in your `$HOME` directory:
```sh
# socheatsok78/dotfile
test -e "$HOME/.zsh_profile" && source "$HOME/.zsh_profile"
```

## Update
To get the latest update of `dotfile` simply run the following command:
```sh
dotfile_update
```

### See also
There are some great dotfiles around:
- [terkelg/dotfiles](https://github.com/terkelg/dotfiles)
- [MikeMcQuaid/dotfiles](https://github.com/MikeMcQuaid/dotfiles)

## :memo: License
Licensed under the [MIT License](LICENSE).

[travis-ci-status]: https://travis-ci.com/socheatsok78/.dotfile

