sudo apt update
sudo apt install zsh -y
# install oh-my-zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
# configure for theme
CONFIG_FILE="${HOME}/.zshrc"
NEW_THEME="dst"
sed -i "s/^ZSH_THEME=\".*\"/ZSH_THEME=\"$NEW_THEME\"/" ${CONFIG_FILE}

# 要添加的插件列表
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
NEW_PLUGINS="zsh-autosuggestions zsh-syntax-highlighting"

# 替换现有的 plugins 行
sed -i "s/^plugins=(.*)/plugins=($NEW_PLUGINS)/" ${CONFIG_FILE}
#  reload config
echo 'source....'
zsh -c "source ~/.zshrc"