# CONFIGS NEOVIM


## Steps

* install git
```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git -y
```
  
* configuring git
```bash
git config --global user.name "your_name_user_git_hub"
git config --global user.email "your_email_user_git_hub"
git config --global core.editor "your_editor ex: nvim"
```

* install node, npm and yarn
```bash

sudo apt install npm -y
cd ~/ && mkdir node && cd node/

npm i n

sudo ./node_modules/n/bin/n stable && cd .. && rm -rf node/

sudo npm i -g yarn

```
* install & configure neovim
```bash

sudo apt install neovim -y
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim  # Here is the neovim configs

```
* install vim-plug

```bash
# vim-plug is plugin manager

cd ~/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```

* insert  [this configurations](init.vim) into `~/.config/nvim/init.vim` save and close

* install the plugins that are in the init.vim
```bash

nvim +PlugInstall

```
wait this finish and **DONE!**

link to learn about how to select multiple lines on vim https://github.com/mg979/vim-visual-multi
