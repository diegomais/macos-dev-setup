echo "Installing: Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing: oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing: Zinit - Plugins Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
echo -e "### Zinit Plugins\nzinit light zdharma/fast-syntax-highlighting\nzinit light zsh-users/zsh-autosuggestions\nzinit light zsh-users/zsh-completions" >>~/.zshrc

echo "Installing: nvm"
/bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash)"

echo "Setting nvm to automatically call nvm use in a directory with a .nvmrc file"
echo -e '#Calling nvm use automatically in a directory with a .nvmrc file\nautoload -U add-zsh-hook\nload-nvmrc() {\n  local node_version="$(nvm version)"\n  local nvmrc_path="$(nvm_find_nvmrc)"\n\n  if [ -n "$nvmrc_path" ]; then \n    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")\n\n    if [ "$nvmrc_node_version" = "N/A" ]; then\n      nvm install\n    elif [ "$nvmrc_node_version" != "$node_version" ]; then\n      nvm use\n    fi\n  elif [ "$node_version" != "$(nvm version default)" ]; then\n    echo "Reverting to nvm default version"\n    nvm use default\n  fi\n}\nadd-zsh-hook chpwd load-nvmrc\nload-nvmrc' >>~/.zshrc

echo "Installing: Yarn"
brew install yarn

echo "Installing: Homebrew: cask-fonts"
brew tap homebrew/cask-fonts

echo "Installing: Font JetBrains Mono - A free and open source typeface for developers"
brew install font-jetbrains-mono

echo "Installing: Font Fira Code - A free monospaced font with programming ligatures"
brew install font-fira-code

echo "Installing: Git - Distributed version control system"
brew install git

echo "Installing: Git Flow - Git extensions to provide high-level repository operations for Vincent Driessen's branching model"
brew install git-flow

echo "Installing: DBeaver Community Edition - Universal database tool and SQL client"
brew install --cask dbeaver-community

echo "Installing: DevDocs App - DevDocs.io combines multiple API documentations in a fast, organized, and searchable interface"
brew install --cask devdocs

echo "Installing: Discord - Voice and text chat software"
brew install --cask discord

echo "Installing: Docker - Pack, ship and run any application as a lightweight container"
brew install --cask docker

echo "Installing: Google Chrome - Web browser"
brew install --cask google-chrome

echo "Installing: MongoDB Compass - GUI for MongoDB"
brew install --cask mongodb-compass

echo "Installing: Mozilla Firefox - Web browser"
brew install --cask firefox

echo "Installing: Notion - Write, plan, collaborate, and get organized"
brew install --cask notion

echo "Installing: Postman - API Testing and Documentation"
brew install --cask postman

echo "Installing: Slack - Chat and Team Communication"
brew install --cask slack

echo "Installing: Amazon Music - Music Streaming Service"
brew install --cask amazon-music

echo "Installing: Deezer - Music Streaming Service"
brew install --cask deezer

echo "Installing: Spotify - Music Streaming Service"
brew install --cask spotify

echo "Installing: SourceTree - Graphical client for Git version control"
brew install --cask sourcetree

echo "Installing: Microsoft Visual Studio Code - Open-source code editor"
brew install --cask visual-studio-code

echo "Installing: Zeplin - Share, organize and collaborate on designs"
brew install --cask zeplin

echo "Installing: Zoom.us - Video communication and virtual meeting platform"
brew install --cask zoom

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
ssh-keygen -t ed25519 -C $git_config_user_email
ssh-add -K ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub

echo "Start the ssh-agent in the background"
eval "$(ssh-agent -s)"

echo "Automatically load SSH keys"
echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
