# phwt's dotfiles

## Prerequisites

- **macOS**
  - [Homebrew](https://brew.sh/)
- **Windows**
  - [Git with Bash](https://git-scm.com/downloads)
  - [Zsh](https://packages.msys2.org/package/zsh)

## Setup

1. (For Git Bash on Windows) Start shell as administrator and enable symlink
   ```sh
   export MSYS=winsymlinks:nativestrict
   ```
2. Enter home directory and clone repository with submodules
   ```sh
   cd ~
   git clone --recursive https://github.com/phwt/dotfiles.git
   # Run `git submodule update --init` if the repository was cloned without the `--recursive` flag
   cd dotfiles
   ```
3. Run install to create symlinks using dotbot
   ```sh
   ./install
   ```
4. Install [Oh My Zsh](https://ohmyz.sh/#install)
5. Restore the `.zshrc` file
   ```sh
   rm ~/.zshrc # Remove the one created by the OMZ installation
   mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc # Restore the symlink one from the dotfiles
   ```
6. Install Zsh plugins
   ```sh
   export ZSH_CUSTOM && ./zsh-plugins.sh
   ```
7. Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh)
8. Restart the terminal
9. Configure Powerlevel10k
   ```sh
   p10k configure
   ```

### Homebrew

[Homebrew](https://brew.sh/) can be used to install macOS tools and applications which stored in the `Brewfile` and can be installed using the following command:

```sh
brew bundle
```

Use the following command to update the `Brewfile` with the current installed tools and applications:

```sh
brew bundle dump
```

- The applications installed from the App Store are also included and managed with [`mas`](https://github.com/mas-cli/mas)
- [`brew-cask-upgrade`](https://github.com/buo/homebrew-cask-upgrade) can be used to upgrade Homebrew casks

### Additional for Windows

#### Install `jq` on Git Bash

Install `jq` from [jqlang/jq](https://github.com/jqlang/jq)

```sh
curl -L -o /usr/bin/jq.exe https://github.com/jqlang/jq/releases/latest/download/jq-win64.exe
```

#### Windows Terminal Profile

<details>
  <summary>Windows Terminal profile</summary>

![Windows Terminal Profile](https://github.com/phwt/dotfiles/assets/28344318/d4132c43-968c-4f61-b65e-7251a5881064)

</details>
