## change shell to /bin/bash
chsh -s /bin/bash

## install brew (also installs MacOS command line tools as a side effect)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"

## install oathtool
brew install oath-toolkit

## python/pyenv setup:
brew install openssl readline sqlite3 xz zlib
brew install pyenv
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
eval "$(pyenv init -)"
pyenv install 3.9.13
pyenv global 3.9.13

## java
brew install jenv
eval "$(jenv init -)"
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
curl https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-jdk11.0.11-macosx_aarch64.tar.gz > tempjdk.tar.gz
tar -xvvf tempjdk.tar.gz
sudo mv zulu11.48.21-ca-jdk11.0.11-macosx_aarch64/zulu-11.jdk /Library/Java/JavaVirtualMachines/
rm tempjdk.tar.gz
rm -r zulu11.48.21-ca-jdk11.0.11-macosx_aarch64
jenv add /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
jenv global zulu64-11.0.11

## install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## install node (builds directly, so takes a while)
nvm install v15.14.0
nvm use v15.14.0

## Heroku
brew tap heroku/brew && brew install heroku
