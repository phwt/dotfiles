# phwt's dotfiles

## Prerequisites

- [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- For Windows:
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
   cd dotfiles
   ```
4. Run install to create symlinks using dotbot
   ```sh
   ./install
   ```
5. Install Zsh plugins
   ```sh
   ./zsh-plugins.sh
   ```
6. Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh)
7. Restart the terminal
8. Configure Powerlevel10k
   ```sh
   p10k configure
   ```

