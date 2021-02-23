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

echo "Installing: Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing: Elixir"
brew install elixir

echo "Installing: Phoenix"
mix archive.install hex phx_new 1.5.7
