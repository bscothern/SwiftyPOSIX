#!/bin/bash

###################################################################
# Setup
###################################################################
SWIFTLINT=$(which swiftlint || exit 1)
function run_swiftlint () {
    ${SWIFTLINT} --strict
}

SWIFT=$(which swift || exit 1)
function run_swift() {
    if [ ${RUN_TESTS} == "YES" ]; then
        ${SWIFT} test;
    else
        ${SWIFT} build;
    fi
}

XCODEBUILD=$(which xcodebuild || exit 1)
function run_xcodebuild_args () {
    if [ ${RUN_TESTS} == "YES" ]; then
        echo "ENABLE_TESTABILITY=YES test"
    else
        echo "build"
    fi
}
function run_xcodebuild () {
    ${XCODEBUILD} -version
    ${XCODEBUILD} \
        -project "${PROJECT}" \
        -scheme "${SCHEME}" \
        -sdk "${SDK}" \
        -destination "${DESTINATION}" \
        -configuration Debug \
        ONLY_ACTIVE_ARCH=NO \
        $(run_xcodebuild_args)
}

###################################################################
# Main Execution
###################################################################
if [[ ${NAME} == "lint" ]]; then
    run_swiftlint
elif [[ ${NAME} == "SwiftPM" ]]; then
    run_swift
elif [[ ${USE_XCODE_BUILD} = "YES" ]]; then
    run_xcodebuild
fi
