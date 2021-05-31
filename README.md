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

* install node
```bash
sudo apt install nodejs -y
sudo apt install npm -y

cd ~/
mkdir node
cd node/

npm i n

# Run as sudo
#this install npm latest version
./node_modules/n/bin/n stable
sudo apt remove nodejs -y
cd ..
rm -rf node/
```
* install yarn as global
```bash
sudo npm i -g yarn
```
* install & configure neovim
```bash
sudo apt install neovim -y
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
```
* insert this configurations into `~/.config/nvim/init.vim` save and close
* install vim-plug
```bash
cd ~/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
* install the plugins that are in the init.vim
```bash
nvim +PlugInstall
```
  wait this finish and **DONE!**

link to learn about how to select multiple lines on vim https://github.com/mg979/vim-visual-multi
