# .dotfile — My personal dotfile environments

### :warning: Use at your own risk
You should only use this on a **fresh installed system!**
This is a personal `dotfile` environment, I intend to use on ***my own system***, but if you insist to use the same environment as I do, please know that you're on your own.

I'm **not responsible** for any damage done to your **system\computer**. Please review the source code before using.

But if you enjoy it please give it a :star:!

## Installation
> WIP

## ZSH First-party plugins you should use
> WIP

### See also
Dotfiles are files and folders on Unix-like systems starting with . that control the configuration of applications and shells on your system. You can store and manage your dotfiles in a repository on GitHub. For advice and tutorials about what to include in your dotfiles repository, see [Personalizing Codespaces for your account][personalizing-codespaces-for-your-account] or [GitHub does dotfiles][github-dotfiles].

There are some great dotfiles around:
- [terkelg/dotfiles](https://github.com/terkelg/dotfiles)
- [MikeMcQuaid/dotfiles](https://github.com/MikeMcQuaid/dotfiles)
- [lifepillar/dotfiles](https://github.com/lifepillar/dotfiles)

## Troubleshooting

**compinit: insecure directories**:

If you somehow have the following issues, do the following

```sh
# zsh compinit: insecure directories, run compaudit for list.
# Ignore insecure directories and continue [y] or abort compinit [n]?

compaudit | xargs chmod g-w
```

### Development

For development you can use the following command to pull all `dotfiles` and `dotfiles-*` repository listed in `.github/clone`.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/socheatsok78/dotfiles/main/.github/clone)"
```

## :memo: License
Licensed under the [MIT License](LICENSE).

[personalizing-codespaces-for-your-account]: https://docs.github.com/en/free-pro-team@latest/github/developing-online-with-codespaces/personalizing-codespaces-for-your-account
[github-dotfiles]: https://dotfiles.github.io/
