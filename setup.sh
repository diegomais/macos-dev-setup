echo "Installing: Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing: Elixir"
brew install elixir

echo "Installing: Phoenix"
mix archive.install hex phx_new 1.5.7
