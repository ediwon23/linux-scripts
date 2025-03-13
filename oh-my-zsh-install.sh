apt install zsh
# install oh-my-zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
# configure for theme
NEW_THEME="dst"
sed -i '' "s/^ZSH_THEME=\".*\"/ZSH_THEME=\"$NEW_THEME\"/" ~/.zshrc

# 要添加的插件列表
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
NEW_PLUGINS="zsh-autosuggestions zsh-syntax-highlighting"

# 检查 ~/.zshrc 是否已有 plugins 配置
if grep -q "^plugins=(" ~/.zshrc; then
    # 替换现有的 plugins 行
    sed -i '' "s/^plugins=(.*)/plugins=($NEW_PLUGINS)/" ~/.zshrc
else
    # 如果没有 plugins 配置，则添加
    echo "plugins=($NEW_PLUGINS)" >> ~/.zshrc
fi