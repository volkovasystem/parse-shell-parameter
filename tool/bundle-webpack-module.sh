#!/usr/bin/env bash

npm install --no-save webpack-cli;

[[ -f "$MODULE_ROOT_DIRECTORY_PATH/setting/bundle-configure.js" ]] &&	\
npx --yes webpack build --config "$MODULE_BUNDLE_SETTING_FILE_PATH";
