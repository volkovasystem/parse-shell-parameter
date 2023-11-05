#!/usr/bin/env bash

npm install --no-save webpack-cli;

[[ -f "$MODULE_BUNDLE_SETTING_FILE_PATH" ]] &&	\
npx --yes webpack build --config "$MODULE_BUNDLE_SETTING_FILE_PATH";

return 0;
