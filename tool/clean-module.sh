#!/usr/bin/env bash

[[ -d "$TRASH_DIRECTORY" ]] &&							\
[[ -f "$MODULE_ROOT_DIRECTORY_PATH/node_modules" ]] &&	\
mv --force "$MODULE_ROOT_DIRECTORY_PATH/node_modules" "$TRASH_DIRECTORY" || true;

[[ -d "$TRASH_DIRECTORY" ]] &&								\
[[ -f "$MODULE_ROOT_DIRECTORY_PATH/package-lock.json" ]] &&	\
mv --force "$MODULE_ROOT_DIRECTORY_PATH/package-lock.json" "$TRASH_DIRECTORY" || true;

npm cache clean --force --loglevel=error;
