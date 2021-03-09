echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Diego Mais\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"diegomais.dev@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set Visual Studio Code as your default GIT editor for you? (y/n)"
read git_core_editor_to_code
if echo "$git_core_editor_to_code" | grep -iq "^y" ;then
	git config --global core.editor code --wait
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

echo "Start the ssh-agent in the background"
eval "$(ssh-agent -s)"

echo "Automatically load SSH keys"
echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config

echo "Installing: oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing: Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing: nvm"
/bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash)"
echo -e '#Calling nvm use automatically in a directory with a .nvmrc file\nautoload -U add-zsh-hook\nload-nvmrc() {\n  local node_version="$(nvm version)"\n  local nvmrc_path="$(nvm_find_nvmrc)"\n\n  if [ -n "$nvmrc_path" ]; then \n    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")\n\n    if [ "$nvmrc_node_version" = "N/A" ]; then\n      nvm install\n    elif [ "$nvmrc_node_version" != "$node_version" ]; then\n      nvm use\n    fi\n  elif [ "$node_version" != "$(nvm version default)" ]; then\n    echo "Reverting to nvm default version"\n    nvm use default\n  fi\n}\nadd-zsh-hook chpwd load-nvmrc\nload-nvmrc' >>~/.zshrc

echo "Installing: Zinit - Plugins Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
echo -e "### Zinit Plugins\nzinit light zdharma/fast-syntax-highlighting\nzinit light zsh-users/zsh-autosuggestions\nzinit light zsh-users/zsh-completions" >>~/.zshrc

echo "Installing: Homebrew: cask-fonts"
brew tap homebrew/cask-fonts

echo "Installing: Font JetBrains Mono"
brew install font-jetbrains-mono

echo "Installing: Font Fira Code"
brew install font-fira-code

echo "Installing: Expo CLI"
npm install -g expo-cli

echo "Installing: Firebase CLI"
npm install -g firebase-tools

echo "Installing: Nest CLI - Node.js Framework"
npm install -g @nestjs/cli

echo "Installing: Elixir"
brew install elixir

echo "Installing: Phoenix"
mix archive.install hex phx_new 1.5.7

echo "Installing: DBeaver Community Edition"
brew install --cask dbeaver-community

echo "Installing: DevDocs App"
brew install --cask devdocs

echo "Installing: Discord"
brew install --cask discord

echo "Installing: Figma"
brew install --cask figma

echo "Installing: Facebook Flipper - Desktop debugging platform for mobile developers"
brew install --cask flipper

echo "Installing: Google Chrome - Web browser"
brew install --cask google-chrome

echo "Installing: Hyper - Terminal built on web technologies"
brew install --cask hyper

echo "Installing: Hyper-Dracula - Dark theme for Hyper"
hyper install hyper-dracula

echo "Installing: Insomnia - HTTP and GraphQL Client"
brew install --cask insomnia

echo "Installing: Microsoft Edge - Web browser"
brew install --cask microsoft-edge

echo "Installing: MongoDB Compass - GUI for MongoDB"
brew install --cask mongodb-compass

echo "Installing: Notion - App to write, plan, collaborate, and get organized"
brew install --cask notion

echo "Installing: Postman - Collaboration platform for API development"
brew install --cask postman

echo "Installing: Powerlevel10k - Theme for Zsh"
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

echo "Installing: React Native Debugger - App for debugging React Native apps"
brew install --cask react-native-debugger

echo "Installing: Reactotron - App for inspecting React JS and React Native projects"
brew install --cask reactotron

echo "Installing: Skype - App for video chat, voice call and instant messaging"
brew install --cask skype

echo "Installing: SourceTree - Graphical client for Git version control"
brew install --cask sourcetree

echo "Installing: Telegram - Messaging app with a focus on speed and security"
brew install --cask telegram

echo "Installing: Microsoft Visual Studio Code - Open-source code editor"
brew install --cask visual-studio-code

echo 'installing: Microsoft Visual Studio Code extensions'
code --install-extension shan.code-settings-sync

echo "Installing: Zeplin - Share, organize and collaborate on designs"
brew install --cask zeplin

echo "Installing: Zoom.us - Video communication and virtual meeting platform"
brew install --cask zoom

echo "Installing: Docker"
brew install --cask docker

echo "Installing: Android Studio"
brew install --cask android-studio

echo "Installing: Desktop client for Amazon Music"
brew install --cask amazon-music

echo "Installing: Spotify - Music streaming service"
brew install --cask spotify
