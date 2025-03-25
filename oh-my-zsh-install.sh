#!/bin/bash

# 更新系统并安装 zsh
sudo apt update
sudo apt install -y zsh

# 安装 oh-my-zsh（不会中断）
RUNZSH=no sh -c "$(curl -fsSL https://install.ohmyz.sh/)"

# 配置主题
CONFIG_FILE="${HOME}/.zshrc"
NEW_THEME="dst"
sed -i "s/^ZSH_THEME=\".*\"/ZSH_THEME=\"$NEW_THEME\"/" "${CONFIG_FILE}"

# 安装插件
ZSH_CUSTOM="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"

# 设置插件
NEW_PLUGINS="git zsh-autosuggestions zsh-syntax-highlighting"
sed -i "s/^plugins=(.*)/plugins=(${NEW_PLUGINS})/" "${CONFIG_FILE}"

# 设置默认 shell 为 zsh
chsh -s "$(command -v zsh)"


# 启动 zsh
zsh
source ~/.zshrc
# 提示用户手动重启 shell
echo '##################'
echo 'Installation complete!'
echo 'Please restart your terminal or run "exec zsh" to apply changes.'
echo '##################' 