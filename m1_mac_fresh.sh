## change shell to /bin/bash
chsh -s /bin/bash

## prompt
echo '## prompt' >> ~/.bash_profile
echo 'export PS1="ℤ \W \$ "' >> ~/.bash_profile

## install brew (also installs MacOS command line tools as a side effect)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '## brew' >> ~/.bash_profile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"

## install oathtool
brew install oath-toolkit

## python/pyenv setup:
brew install openssl readline sqlite3 xz zlib
brew install pyenv
echo '## pyenv' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
eval "$(pyenv init -)"
pyenv install 3.9.13
pyenv global 3.9.13

## java
brew install jenv
eval "$(jenv init -)"
echo '## jenv' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
curl https://cdn.azul.com/zulu/bin/zulu17.34.19-ca-jdk17.0.3-macosx_aarch64.tar.gz > tempjdk.tar.gz
tar -xvvf tempjdk.tar.gz
sudo mv zulu17.34.19-ca-jdk17.0.3-macosx_aarch64/zulu-17.jdk /Library/Java/JavaVirtualMachines/
rm tempjdk.tar.gz
rm -r zulu17.34.19-ca-jdk17.0.3-macosx_aarch64
jenv add /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
jenv global zulu64-17.0.3

## install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## install node (builds directly, so takes a while)
nvm install v16.15.1
nvm use v16.15.1

## Heroku
brew tap heroku/brew && brew install heroku
