#!/bin/bash -x

PROJECT_NAME="SwiftyPOSIX"
PROJECT="${PROJECT_NAME}.xcodeproj"
SCHEME="${PROJECT_NAME} ${NAME}"
###################################################################
# Setup
###################################################################
SWIFTLINT=$(which swiftlint)
function run_swiftlint () {
    ${SWIFTLINT} --strict
}

if [[ $TRAVIS_OS_NAME != "linux" ]]; then
    SWIFT=./usr/bin/swift
else
    SWIFT=$(which swift)
fi
function run_swift() {
    if [[ ${RUN_TESTS} == "True" ]]; then
        ${SWIFT} test;
    else
        ${SWIFT} build;
    fi
}

XCODEBUILD=$(which xcodebuild)
function run_xcodebuild_args () {
    if [[ ${RUN_TESTS} == "True" ]]; then
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
if [[ ${NAME} == "Swiftlint" ]]; then
    run_swiftlint
elif [[ ${NAME} == "SwiftPM" ]]; then
    run_swift
elif [[ ${USE_XCODE_BUILD} = "True" ]]; then
    run_xcodebuild
else
    echo "Invalid build scheme in matrix"
    exit 1
fi
