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
pyenv install 3.11.6
pyenv global 3.11.6

## java
brew install jenv
eval "$(jenv init -)"
echo '## jenv' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
# go to https://adoptium.net/download/ and download
tar -xvvf OpenJDK17U-jdk_aarch64_mac_hotspot_17.0.9_9.tar.gz
sudo mv jdk-17.0.9+9 /Library/Java/JavaVirtualMachines/
rm OpenJDK17U-jdk_aarch64_mac_hotspot_17.0.9_9.tar.gz
jenv add /Library/Java/JavaVirtualMachines/jdk-17.0.9+9/Contents/Home
jenv global 17.0.9

## scala
curl -fL https://github.com/VirtusLab/coursier-m1/releases/latest/download/cs-aarch64-apple-darwin.gz | gzip -d > cs && chmod +x cs && (xattr -d com.apple.quarantine cs || true) && ./cs setup

## install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## install node (builds directly, so takes a while)
nvm install v20.9.0
nvm use v20.9.0


## rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
