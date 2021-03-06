#!/bin/bash -x

if [[ $TRAVIS_OS_NAME != "linux" ]]; then
    exit 0
fi

SWIFT_VERSION="5.0"
OS_VERSION_SHORT="ubuntu1604"
OS_VERSION_FULL="ubuntu16.04"

# Setup dependencies
wget -q -O - https://swift.org/keys/all-keys.asc | sudo gpg --import -

# Install Swift
wget https://swift.org/builds/swift-${SWIFT_VERSION}-release/${OS_VERSION_SHORT}/swift-${SWIFT_VERSION}-RELEASE/swift-${SWIFT_VERSION}-RELEASE-${OS_VERSION_FULL}.tar.gz
tar xzf swift-${SWIFT_VERSION}-RELEASE-${OS_VERSION_FULL}.tar.gz -C . --strip-components=1
