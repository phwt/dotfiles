# phwt's dotfiles

## Prerequisites

- [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- For Windows:
  - [Git with Bash](https://git-scm.com/downloads)
  - [Zsh](https://packages.msys2.org/package/zsh)

<details>
  <summary>Windows Terminal profile</summary>

  ![image](https://github.com/phwt/dotfiles/assets/28344318/d4132c43-968c-4f61-b65e-7251a5881064)
</details>

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

### Additional for Git Bash on Windows

#### Install `jq`

Install `jq` from [jqlang/jq](https://github.com/jqlang/jq)

```sh
curl -L -o /usr/bin/jq.exe https://github.com/jqlang/jq/releases/latest/download/jq-win64.exe
```

