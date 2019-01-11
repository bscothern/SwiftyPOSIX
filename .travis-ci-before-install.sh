#!/bin/bash

if [[ $TRAVIS_OS_NAME != "linux" ]]; then
    exit 0
fi

# Setup dependencies
sudo apt-get install clang libicu-dev libcurl3 libpython2.7 libpython2.7-dev 
wget -q -O - https://swift.org/keys/all-keys.asc | sudo gpg --import -

# Install Swift
wget https://swift.org/builds/swift-4.2.1-release/ubuntu1604/swift-4.2.1-RELEASE/swift-4.2.1-RELEASE-ubuntu16.04.tar.gz
sudo tar xzf swift-4.2.1-RELEASE-ubuntu16.04.tar.gz
sudo mv swift-4.2.1-RELEASE-ubuntu16.04 /usr/share/swift

# Setup env
echo "export PATH=/usr/share/swift/usr/bin:$PATH" >> ~/.bashrc
source  ~/.bashrc

