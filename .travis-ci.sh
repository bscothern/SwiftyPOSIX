#!/bin/bash

SWIFTLINT=$(which swiftlint || exit 1)
SWIFT=$(which swift || exit 1)
XCODEBUILD=$(which xcodebuild || exit 1)

function do_xcodebuild () {
    ${XCODEBUILD} -version
    ${XCODEBUILD} -project "${PROJECT}" -scheme "${SCHEME}" -sdk "${SDK}" -destination "${DESTINATION}" -configuration Debug ONLY_ACTIVE_ARCH=NO $@
}

if [[ "${NAME}" == "lint" ]]; then
    ${SWIFTLINT} --strict;
elif [[ "${NAME}" == "SwiftPM" ]]; then
    if [ "${RUN_TESTS}" == "YES" ]; then
        ${SWIFT} test;
    else
        ${SWIFT} build;
    fi
fi

if [[ ${USE_XCODE_BUILD} != "YES" ]]; then
    exit 0;
fi

if [ "${RUN_TESTS}" == "YES" ]; then
    do_xcodebuild ENABLE_TESTABILITY=YES test
else
    do_xcodebuild build;
fi

