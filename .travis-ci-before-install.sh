#!/bin/bash -x

if [[ $TRAVIS_OS_NAME != "linux" ]]; then
    exit 0
fi

SWIFT_VERSION="4.2.1"
OS_VERSION_SHORT="ubuntu1604"
OS_VERSION_FULL="ubuntu16.04"

# Setup dependencies
wget -q -O - https://swift.org/keys/all-keys.asc | sudo gpg --import -

# Install Swift
wget https://swift.org/builds/swift-${SWIFT_VERSION}-release/${OS_VERSION_SHORT}/swift-${SWIFT_VERSION}-RELEASE/swift-${SWIFT_VERSION}-RELEASE-${OS_VERSION_FULL}.tar.gz
sudo tar xzf swift-${SWIFT_VERSION}-RELEASE-${OS_VERSION_FULL}.tar.gz -v -C / --strip-components=1

ls /usr/bin
ls /usr
ls /
