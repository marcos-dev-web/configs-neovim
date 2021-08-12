# exclude node_modules


1. install dependencies
```bash
sudo apt install ripgrep -y
```

2. put in your `.zshrc` or `.bashrc`

```bash
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
```
