sudo scutil --set ComputerName "reevonr"
sudo scutil --set LocalHostName "reevonr"
sudo scutil --set HostName "reevonr"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

omz update
