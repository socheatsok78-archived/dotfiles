# .dotfile — My personal dotfile environments

[![Build Status](https://travis-ci.com/socheatsok78/.dotfile.svg?branch=master)][travis-ci-status]

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

