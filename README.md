# exclude node_modules


1. install dependencies
```bash
sudo apt install ripgrep -y
```

2. put in your `.zshrc` or `.bashrc`

```bash
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
```

# Install git

```bash
add-apt-repository ppa:git-core/ppa # apt update; apt install git
```

# Install vim-plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
