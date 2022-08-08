echo "Installing: Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing: oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing: nvm"
/bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash)"

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

echo "Installing: OpenJDK - Java Development Kit (JDK) and a programming language runtime environment"
brew install --cask adoptopenjdk/openjdk/adoptopenjdk11

echo "Installing: Amazon Music - Music Streaming Service"
brew install --cask amazon-music

echo "Installing: Brave Browser - A free and open-source web browser"
brew install --cask brave-browser

echo "Installing: DBeaver Community Edition - Universal database tool and SQL client"
brew install --cask dbeaver-community

echo "Installing: DevDocs App - DevDocs.io combines multiple API documentations in a fast, organized, and searchable interface"
brew install --cask devdocs

echo "Installing: Discord - Voice and text chat software"
brew install --cask discord

echo "Installing: Docker - Pack, ship and run any application as a lightweight container"
brew install --cask docker

echo "Installing: Figma - Design and prototype your apps in a fast and intuitive way"
brew install --cask figma

echo "Installing: Mozilla Firefox - Web browser"
brew install --cask firefox

echo "Installing: Google Chrome - Web browser"
brew install --cask google-chrome

echo "Installing: MongoDB Compass - GUI for MongoDB"
brew install --cask mongodb-compass

echo "Installing: Notion - Write, plan, collaborate, and get organized"
brew install --cask notion

echo "Installing: Postman - API Testing and Documentation"
brew install --cask postman

echo "Installing: Slack - Chat and Team Communication"
brew install --cask slack

echo "Installing: Microsoft Visual Studio Code - Open-source code editor"
brew install --cask visual-studio-code

echo "Installing: Zeplin - Share, organize and collaborate on designs"
brew install --cask zeplin

echo "Installing: Zoom.us - Video communication and virtual meeting platform"
brew install --cask zoom

echo "Installing: zsh-autosuggestions - Auto-completion for zsh"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Please add zsh-autosuggestions to plugins in your ~/.zshrc file. E.g. plugins=(git zsh-autosuggestions)"

echo "Installing: zsh-syntax-highlighting - Syntax highlighting for zsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Please add zsh-syntax-highlighting to plugins in your ~/.zshrc file. E.g. plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"

echo "Installing: zsh-completions - Completion for zsh"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
echo "Please add it to FPATH in your .zshrc file by adding the following line before source \"$ZSH/oh-my-zsh.sh\": fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src"

echo "Installing: SpaceShip - Powerline-inspired theme for zsh"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo "Please change your theme in your .zshrc file by replacing ZSH_THEME to spaceship

echo "Please add the following lines to your .zshrc file:"
echo "SPACESHIP_PROMPT_ORDER=(\n\n  user          \# Username section\n  dir           \# Current directory section\n  host          \# Hostname section\n  git           \# Git section (git_branch + git_status)\n  node           \# Node.js section\n  exec_time     \# Execution time\n  vi_mode       \# Vi-mode indicator\n  jobs          \# Background jobs indicator\n  exit_code     \# Exit code section\n  char          \# Prompt character\n)\nSPACESHIP_USER_SHOW=always\nSPACESHIP_PROMPT_ADD_NEWLINE=false\nSPACESHIP_CHAR_SYMBOL="❯"\nSPACESHIP_CHAR_SUFFIX=" "

echo "Auto setup remote upstream on default push when no upstream tracking exists for the current branch:"
git config --global push.autoSetupRemote true

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

echo "Can I set main as your initial default branch for you? (y/n)"
read defaultBranch
if echo "$defaultBranch" | grep -iq "^y" ;then
	git config --global init.defaultBranch main
else
	echo "Okay, no problem. :) Let's move on!"
fi

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
